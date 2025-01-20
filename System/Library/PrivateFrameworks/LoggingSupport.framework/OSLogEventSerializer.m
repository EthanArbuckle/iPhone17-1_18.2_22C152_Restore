@interface OSLogEventSerializer
- (BOOL)_isBatchCompleted;
- (NSMutableArray)curBatchDictionaries;
- (NSPredicate)filterPredicate;
- (OSLogEventSerializer)initWithSource:(id)a3 dataProcessingBlock:(id)a4 completionBlock:(id)a5;
- (OSLogEventSource)source;
- (OSLogEventStream)stream;
- (OS_dispatch_queue)target;
- (_OSLogEventSerializationMetadata)metadata;
- (id)_arrayForDecomposedMessage:(id)a3 indicesToRedact:(id)a4;
- (id)_dictForArg:(id)a3 shouldRedactValue:(BOOL)a4;
- (id)_dictForDecomposedMessage:(id)a3 index:(unint64_t)a4 shouldRedact:(BOOL)a5;
- (id)_dictForDecomposedMessage:(id)a3 indicesToRedact:(id)a4;
- (id)_dictForPlaceholder:(id)a3;
- (id)_dictionaryForProxy:(id)a3;
- (id)argumentRedactionBlock;
- (unint64_t)curBatchSize;
- (unint64_t)flags;
- (unint64_t)maxLogEventBatchSize;
- (unint64_t)serializedEventCount;
- (void)_completeBatch:(id)a3;
- (void)_serializeEvent:(id)a3;
- (void)invalidate;
- (void)serializeFromDate:(id)a3;
- (void)serializeFromDate:(id)a3 toDate:(id)a4;
- (void)serializeFromLastBoot;
- (void)serializeFromPosition:(id)a3;
- (void)setArgumentRedactionBlock:(id)a3;
- (void)setCurBatchSize:(unint64_t)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setMaxLogEventBatchSize:(unint64_t)a3;
- (void)setTarget:(id)a3;
@end

@implementation OSLogEventSerializer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_argumentRedactionBlock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_curBatchDictionaries, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)setArgumentRedactionBlock:(id)a3
{
}

- (id)argumentRedactionBlock
{
  return self->_argumentRedactionBlock;
}

- (unint64_t)serializedEventCount
{
  return self->_serializedEventCount;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (NSMutableArray)curBatchDictionaries
{
  return self->_curBatchDictionaries;
}

- (void)setCurBatchSize:(unint64_t)a3
{
  self->_curBatchSize = a3;
}

- (unint64_t)curBatchSize
{
  return self->_curBatchSize;
}

- (void)setMaxLogEventBatchSize:(unint64_t)a3
{
  self->_maxLogEventBatchSize = a3;
}

- (unint64_t)maxLogEventBatchSize
{
  return self->_maxLogEventBatchSize;
}

- (OSLogEventStream)stream
{
  return self->_stream;
}

- (void)_completeBatch:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *))a3;
  v14[0] = @"Version";
  v14[1] = @"Events";
  v15[0] = &unk_1EF44AF58;
  v6 = [(OSLogEventSerializer *)self curBatchDictionaries];
  v15[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  id v13 = 0;
  v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v13];
  id v9 = v13;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:608 description:@"Failed to serialize to plist format"];
  }
  v5[2](v5, v8);
  self->_curBatchSize = 0;
  v10 = [MEMORY[0x1E4F1CA48] array];
  curBatchDictionaries = self->_curBatchDictionaries;
  self->_curBatchDictionaries = v10;
}

- (id)_dictionaryForProxy:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v14 = 0;
    goto LABEL_110;
  }
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  argumentRedactionBlock = (void (**)(id, id))self->_argumentRedactionBlock;
  if (argumentRedactionBlock)
  {
    v7 = argumentRedactionBlock[2](argumentRedactionBlock, v4);
    v8 = v7;
    if (v7)
    {
      if ([v7 count])
      {
        unint64_t v9 = [v8 firstIndex];
        v10 = [v4 decomposedMessage];
        unint64_t v11 = [v10 placeholderCount];

        if (v9 < v11)
        {
          v12 = [(OSLogEventSerializer *)self metadata];
          id v13 = [v12 indexForString:@"<value-redacted>"];
          [v5 setObject:v13 forKeyedSubscript:@"cm"];
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v15 = [v4 composedMessage];

  if (!v15) {
    goto LABEL_12;
  }
  v12 = [(OSLogEventSerializer *)self metadata];
  id v13 = [v4 composedMessage];
  v16 = [v12 indexForString:v13];
  [v5 setObject:v16 forKeyedSubscript:@"cm"];

LABEL_11:
LABEL_12:
  v17 = [v4 processImagePath];

  if (v17)
  {
    v18 = [(OSLogEventSerializer *)self metadata];
    v19 = [v4 processImagePath];
    v20 = [v18 indexForString:v19];
    [v5 setObject:v20 forKeyedSubscript:@"pip"];
  }
  v21 = [v4 process];

  if (v21)
  {
    v22 = [(OSLogEventSerializer *)self metadata];
    v23 = [v4 process];
    v24 = [v22 indexForString:v23];
    [v5 setObject:v24 forKeyedSubscript:@"p"];
  }
  v25 = [v4 senderImagePath];

  if (v25)
  {
    v26 = [(OSLogEventSerializer *)self metadata];
    v27 = [v4 senderImagePath];
    v28 = [v26 indexForString:v27];
    [v5 setObject:v28 forKeyedSubscript:@"sip"];
  }
  v29 = [v4 sender];

  if (v29)
  {
    v30 = [(OSLogEventSerializer *)self metadata];
    v31 = [v4 sender];
    v32 = [v30 indexForString:v31];
    [v5 setObject:v32 forKeyedSubscript:@"send"];
  }
  if ([v4 type])
  {
    v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
    [v5 setObject:v33 forKeyedSubscript:@"t"];
  }
  if ([v4 logType])
  {
    v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "logType"));
    [v5 setObject:v34 forKeyedSubscript:@"lt"];
  }
  if ([v4 size])
  {
    v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", objc_msgSend(v4, "size"));
    [v5 setObject:v35 forKeyedSubscript:@"s"];
  }
  if ([v4 timeToLive])
  {
    v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "timeToLive"));
    [v5 setObject:v36 forKeyedSubscript:@"ttl"];
  }
  if ([v4 traceIdentifier])
  {
    v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "traceIdentifier"));
    [v5 setObject:v37 forKeyedSubscript:@"ti"];
  }
  if ([v4 threadIdentifier])
  {
    v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "threadIdentifier"));
    [v5 setObject:v38 forKeyedSubscript:@"tid"];
  }
  if ([v4 processIdentifier])
  {
    v39 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
    [v5 setObject:v39 forKeyedSubscript:@"pid"];
  }
  if ([v4 activityIdentifier])
  {
    v40 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "activityIdentifier"));
    [v5 setObject:v40 forKeyedSubscript:@"aid"];
  }
  if ([v4 parentActivityIdentifier])
  {
    v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "parentActivityIdentifier"));
    [v5 setObject:v41 forKeyedSubscript:@"paid"];
  }
  if ([v4 transitionActivityIdentifier])
  {
    v42 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "transitionActivityIdentifier"));
    [v5 setObject:v42 forKeyedSubscript:@"tai"];
  }
  if ([v4 continuousNanosecondsSinceBoot])
  {
    v43 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "continuousNanosecondsSinceBoot"));
    [v5 setObject:v43 forKeyedSubscript:@"ns"];
  }
  if ([v4 machContinuousTimestamp])
  {
    v44 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "machContinuousTimestamp"));
    [v5 setObject:v44 forKeyedSubscript:@"mct"];
  }
  if ([v4 senderImageOffset])
  {
    v45 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "senderImageOffset"));
    [v5 setObject:v45 forKeyedSubscript:@"sio"];
  }
  v46 = [v4 bootUUID];

  if (v46)
  {
    v47 = [v4 bootUUID];
    v48 = _dataForUUID(v47);
    [v5 setObject:v48 forKeyedSubscript:@"b"];
  }
  v49 = [v4 processImageUUID];

  if (v49)
  {
    v50 = [v4 processImageUUID];
    v51 = _dataForUUID(v50);
    [v5 setObject:v51 forKeyedSubscript:@"piu"];
  }
  v52 = [v4 senderImageUUID];

  if (v52)
  {
    v53 = [v4 senderImageUUID];
    v54 = _dataForUUID(v53);
    [v5 setObject:v54 forKeyedSubscript:@"siu"];
  }
  if ([v4 unixDate])
  {
    v55 = _dictForTimeval([v4 unixDate]);

    if (v55)
    {
      v56 = _dictForTimeval([v4 unixDate]);
      [v5 setObject:v56 forKeyedSubscript:@"ud"];
    }
  }
  if ([v4 unixTimeZone])
  {
    v57 = _dictForTimezone((unsigned int *)[v4 unixTimeZone]);

    if (v57)
    {
      v58 = _dictForTimezone((unsigned int *)[v4 unixTimeZone]);
      [v5 setObject:v58 forKeyedSubscript:@"utz"];
    }
  }
  uint64_t v59 = [v4 backtrace];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [v4 backtrace];
    v62 = [v61 frames];
    unint64_t v63 = [v62 count];

    if (v63 >= 2)
    {
      v64 = [v4 backtrace];
      v65 = _dictArrayForBacktrace(v64);

      if (v65)
      {
        v66 = [v4 backtrace];
        v67 = _dictArrayForBacktrace(v66);
        [v5 setObject:v67 forKeyedSubscript:@"bt"];
      }
    }
  }
  uint64_t v68 = [v4 type];
  if (v68 <= 1023)
  {
    if (v68 == 513)
    {
      if ([v4 creatorActivityIdentifier])
      {
        v102 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "creatorActivityIdentifier"));
        [v5 setObject:v102 forKeyedSubscript:@"cai"];
      }
      if (![v4 creatorProcessUniqueIdentifier]) {
        goto LABEL_109;
      }
      v80 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "creatorProcessUniqueIdentifier"));
      v81 = @"cpui";
      goto LABEL_107;
    }
    if (v68 != 768) {
      goto LABEL_109;
    }
  }
  else
  {
    if (v68 != 1024)
    {
      if (v68 != 1536)
      {
        if (v68 != 1792) {
          goto LABEL_109;
        }
        if ([v4 lossStartMachContinuousTimestamp])
        {
          v69 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "lossStartMachContinuousTimestamp"));
          [v5 setObject:v69 forKeyedSubscript:@"lsmct"];
        }
        if ([v4 lossEndMachContinuousTimestamp])
        {
          v70 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "lossEndMachContinuousTimestamp"));
          [v5 setObject:v70 forKeyedSubscript:@"lemct"];
        }
        if ([v4 lossStartUnixDate])
        {
          v71 = _dictForTimeval([v4 lossStartUnixDate]);

          if (v71)
          {
            v72 = _dictForTimeval([v4 lossStartUnixDate]);
            [v5 setObject:v72 forKeyedSubscript:@"lsud"];
          }
        }
        if ([v4 lossEndUnixDate])
        {
          v73 = _dictForTimeval([v4 lossEndUnixDate]);

          if (v73)
          {
            v74 = _dictForTimeval([v4 lossEndUnixDate]);
            [v5 setObject:v74 forKeyedSubscript:@"leud"];
          }
        }
        if ([v4 lossStartUnixTimeZone])
        {
          v75 = _dictForTimezone((unsigned int *)[v4 lossStartUnixTimeZone]);

          if (v75)
          {
            v76 = _dictForTimezone((unsigned int *)[v4 lossStartUnixTimeZone]);
            [v5 setObject:v76 forKeyedSubscript:@"lsutz"];
          }
        }
        if ([v4 lossEndUnixTimeZone])
        {
          v77 = _dictForTimezone((unsigned int *)[v4 lossEndUnixTimeZone]);

          if (v77)
          {
            v78 = _dictForTimezone((unsigned int *)[v4 lossEndUnixTimeZone]);
            [v5 setObject:v78 forKeyedSubscript:@"leutz"];
          }
        }
        v79 = _dictForLossCount([v4 lossCount]);

        if (!v79) {
          goto LABEL_109;
        }
        v80 = _dictForLossCount([v4 lossCount]);
        v81 = @"lc";
        goto LABEL_107;
      }
      if ([v4 signpostIdentifier])
      {
        v82 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "signpostIdentifier"));
        [v5 setObject:v82 forKeyedSubscript:@"si"];
      }
      if ([v4 signpostType])
      {
        v83 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "signpostType"));
        [v5 setObject:v83 forKeyedSubscript:@"st"];
      }
      if ([v4 signpostScope])
      {
        v84 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "signpostScope"));
        [v5 setObject:v84 forKeyedSubscript:@"ss"];
      }
      v85 = [v4 signpostName];

      if (v85)
      {
        v86 = [(OSLogEventSerializer *)self metadata];
        v87 = [v4 signpostName];
        v88 = [v86 indexForString:v87];
        [v5 setObject:v88 forKeyedSubscript:@"sn"];
      }
    }
    v89 = [v4 subsystem];

    if (v89)
    {
      v90 = [(OSLogEventSerializer *)self metadata];
      v91 = [v4 subsystem];
      v92 = [v90 indexForString:v91];
      [v5 setObject:v92 forKeyedSubscript:@"sub"];
    }
    v93 = [v4 category];

    if (v93)
    {
      v94 = [(OSLogEventSerializer *)self metadata];
      v95 = [v4 category];
      v96 = [v94 indexForString:v95];
      [v5 setObject:v96 forKeyedSubscript:@"cat"];
    }
  }
  v97 = [v4 formatString];

  if (v97)
  {
    v98 = [(OSLogEventSerializer *)self metadata];
    v99 = [v4 formatString];
    v100 = [v98 indexForString:v99];
    [v5 setObject:v100 forKeyedSubscript:@"f"];
  }
  v101 = [v4 decomposedMessage];
  v80 = [(OSLogEventSerializer *)self _dictForDecomposedMessage:v101 indicesToRedact:v8];

  if (!v80) {
    goto LABEL_108;
  }
  v81 = @"dm";
LABEL_107:
  [v5 setObject:v80 forKeyedSubscript:v81];
LABEL_108:

LABEL_109:
  id v14 = v5;

LABEL_110:
  return v14;
}

- (id)_dictForDecomposedMessage:(id)a3 indicesToRedact:(id)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([v6 placeholderCount])
    {
      v15[0] = @"pc";
      v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "placeholderCount"));
      v16[0] = v8;
      v15[1] = @"s";
      unint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "state"));
      v16[1] = v9;
      v15[2] = @"seg";
      v10 = [(OSLogEventSerializer *)self _arrayForDecomposedMessage:v6 indicesToRedact:v7];
      v16[2] = v10;
      unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    }
    else
    {
      v13[0] = @"pc";
      v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "placeholderCount"));
      v13[1] = @"s";
      v14[0] = v8;
      unint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "state"));
      v14[1] = v9;
      unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)_arrayForDecomposedMessage:(id)a3 indicesToRedact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  [v6 placeholderCount];
  unint64_t v9 = 0;
  do
  {
    uint64_t v10 = -[OSLogEventSerializer _dictForDecomposedMessage:index:shouldRedact:](self, "_dictForDecomposedMessage:index:shouldRedact:", v6, v9, [v7 containsIndex:v9]);
    if (!v10) {
      break;
    }
    unint64_t v11 = (void *)v10;
    [v8 addObject:v10];

    ++v9;
  }
  while (v9 <= [v6 placeholderCount]);

  return v8;
}

- (id)_dictForDecomposedMessage:(id)a3 index:(unint64_t)a4 shouldRedact:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unint64_t v9 = [v8 literalPrefixAtIndex:a4];
  uint64_t v10 = [v8 placeholderAtIndex:a4];
  unint64_t v11 = [v8 argumentAtIndex:a4];

  if (v9 || v10 || v11)
  {
    v12 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v9)
    {
      id v13 = [(OSLogEventSerializer *)self metadata];
      id v14 = [v13 indexForString:v9];
      [v12 setObject:v14 forKeyedSubscript:@"lp"];
    }
    if (v10)
    {
      v15 = [(OSLogEventSerializer *)self _dictForPlaceholder:v10];
      [v12 setObject:v15 forKeyedSubscript:@"p"];
    }
    if (v11)
    {
      v16 = [(OSLogEventSerializer *)self _dictForArg:v11 shouldRedactValue:v5];
      [v12 setObject:v16 forKeyedSubscript:@"a"];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_dictForArg:(id)a3 shouldRedactValue:(BOOL)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a4) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = [v6 availability];
  }
  unint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
  [v7 setObject:v9 forKeyedSubscript:@"a"];

  if ([v6 availability])
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "availability"));
    [v7 setObject:v10 forKeyedSubscript:@"a"];
  }
  if ([v6 privacy])
  {
    unint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "privacy"));
    [v7 setObject:v11 forKeyedSubscript:@"p"];
  }
  if ([v6 category])
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
    [v7 setObject:v12 forKeyedSubscript:@"c"];
  }
  if ([v6 category] == 1)
  {
    if ([v6 scalarCategory])
    {
      id v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "scalarCategory"));
      [v7 setObject:v13 forKeyedSubscript:@"sc"];
    }
    if ([v6 scalarType])
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "scalarType"));
      [v7 setObject:v14 forKeyedSubscript:@"st"];
    }
  }
  if (v8 == 3 || !v8)
  {
    uint64_t v15 = [v6 objectRepresentation];
    if (v15)
    {
      v16 = (void *)v15;
      if ([v6 category] != 2
        || ([(OSLogEventSerializer *)self metadata],
            v17 = objc_claimAutoreleasedReturnValue(),
            [v17 indexForString:v16],
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            v16,
            v17,
            (v16 = (void *)v18) != 0))
      {
        [v7 setObject:v16 forKeyedSubscript:@"or"];
      }
    }
  }

  return v7;
}

- (id)_dictForPlaceholder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [v4 rawString];
  if (v6)
  {
    id v7 = [(OSLogEventSerializer *)self metadata];
    uint64_t v8 = [v7 indexForString:v6];
    [v5 setObject:v8 forKeyedSubscript:@"rs"];
  }
  unint64_t v9 = [v4 tokens];
  uint64_t v10 = v9;
  if (v9 && [v9 count])
  {
    v30 = v6;
    unint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v29 = v10;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v18 = [(OSLogEventSerializer *)self metadata];
          v19 = [v18 indexForString:v17];
          [v11 addObject:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }

    [v5 setObject:v11 forKeyedSubscript:@"t"];
    uint64_t v10 = v29;
    id v6 = v30;
  }
  v20 = objc_msgSend(v4, "typeNamespace", v29);
  if (v20)
  {
    v21 = [(OSLogEventSerializer *)self metadata];
    v22 = [v21 indexForString:v20];
    [v5 setObject:v22 forKeyedSubscript:@"tn"];
  }
  v23 = [v4 type];
  if (v23)
  {
    v24 = [(OSLogEventSerializer *)self metadata];
    v25 = [v24 indexForString:v23];
    [v5 setObject:v25 forKeyedSubscript:@"ty"];
  }
  v26 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "width"));
  [v5 setObject:v26 forKeyedSubscript:@"w"];

  v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "precision"));
  [v5 setObject:v27 forKeyedSubscript:@"p"];

  return v5;
}

- (BOOL)_isBatchCompleted
{
  unint64_t v3 = [(OSLogEventSerializer *)self curBatchSize];
  return v3 >= [(OSLogEventSerializer *)self maxLogEventBatchSize];
}

- (void)_serializeEvent:(id)a3
{
  id v14 = a3;
  BOOL v5 = [(OSLogEventSerializer *)self metadata];
  id v6 = [v5 firstDate];

  if (!v6)
  {
    id v7 = [v14 date];
    uint64_t v8 = [(OSLogEventSerializer *)self metadata];
    [v8 setFirstDate:v7];
  }
  unint64_t v9 = [v14 date];
  uint64_t v10 = [(OSLogEventSerializer *)self metadata];
  [v10 setLastDate:v9];

  [(OSLogEventSerializer *)self setCurBatchSize:[(OSLogEventSerializer *)self curBatchSize] + 1];
  ++self->_serializedEventCount;
  unint64_t v11 = [(OSLogEventSerializer *)self _dictionaryForProxy:v14];
  if (!v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:307 description:@"Encountered serialization failure"];
  }
  id v12 = [(OSLogEventSerializer *)self curBatchDictionaries];
  [v12 addObject:v11];
}

- (void)invalidate
{
  id v2 = [(OSLogEventSerializer *)self stream];
  [v2 invalidate];
}

- (void)serializeFromPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(OSLogEventSerializer *)self stream];
  [v5 activateStreamFromPosition:v4];
}

- (void)serializeFromLastBoot
{
  id v2 = [(OSLogEventSerializer *)self stream];
  [v2 activateStreamFromLastBoot];
}

- (void)serializeFromDate:(id)a3 toDate:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(OSLogEventSerializer *)self stream];
  uint64_t v8 = v11;
  if (v11)
  {
    if (v6)
    {
LABEL_3:
      [v7 activateStreamFromDate:v8 toDate:v6];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    if (v6) {
      goto LABEL_3;
    }
  }
  unint64_t v9 = [(OSLogEventStream *)self->_stream source];
  uint64_t v10 = [v9 newestDate];
  [v7 activateStreamFromDate:v8 toDate:v10];

LABEL_6:
  if (!v11) {
}
  }

- (void)serializeFromDate:(id)a3
{
  id v7 = a3;
  id v4 = [(OSLogEventSerializer *)self stream];
  id v5 = v4;
  if (v7)
  {
    [v4 activateStreamFromDate:v7];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v5 activateStreamFromDate:v6];
  }
}

- (OSLogEventSource)source
{
  id v2 = [(OSLogEventSerializer *)self stream];
  unint64_t v3 = [v2 source];

  return (OSLogEventSource *)v3;
}

- (OS_dispatch_queue)target
{
  id v2 = [(OSLogEventSerializer *)self stream];
  unint64_t v3 = [v2 target];

  return (OS_dispatch_queue *)v3;
}

- (void)setTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(OSLogEventSerializer *)self stream];
  [v5 setTarget:v4];
}

- (NSPredicate)filterPredicate
{
  id v2 = [(OSLogEventSerializer *)self stream];
  unint64_t v3 = [v2 filterPredicate];

  return (NSPredicate *)v3;
}

- (void)setFilterPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(OSLogEventSerializer *)self stream];
  [v5 setFilterPredicate:v4];
}

- (unint64_t)flags
{
  id v2 = [(OSLogEventSerializer *)self stream];
  unint64_t v3 = [v2 flags];

  return v3;
}

- (void)setFlags:(unint64_t)a3
{
  id v4 = [(OSLogEventSerializer *)self stream];
  [v4 setFlags:a3];
}

- (OSLogEventSerializer)initWithSource:(id)a3 dataProcessingBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  id v12 = 0;
  if (v9 && v10)
  {
    v31.receiver = self;
    v31.super_class = (Class)OSLogEventSerializer;
    self = [(OSLogEventSerializer *)&v31 init];
    if (!self)
    {
LABEL_6:
      self = self;
      id v12 = self;
      goto LABEL_7;
    }
    uint64_t v13 = [[OSLogEventStream alloc] initWithSource:v8];
    stream = self->_stream;
    self->_stream = v13;

    self->_maxLogEventBatchSize = 1000;
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    curBatchDictionaries = self->_curBatchDictionaries;
    self->_curBatchDictionaries = v15;

    uint64_t v17 = objc_alloc_init(_OSLogEventSerializationMetadata);
    metadata = self->_metadata;
    self->_metadata = v17;

    id v12 = [(OSLogEventSerializer *)self stream];

    if (v12)
    {
      objc_initWeak(&location, self);
      v19 = self->_stream;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke;
      v27[3] = &unk_1E5A43218;
      objc_copyWeak(&v29, &location);
      id v20 = v9;
      id v28 = v20;
      [(OSLogEventStreamBase *)v19 setEventHandler:v27];
      v21 = self->_stream;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke_2;
      v23[3] = &unk_1E5A43240;
      objc_copyWeak(&v26, &location);
      id v24 = v20;
      id v25 = v11;
      [(OSLogEventStreamBase *)v21 setInvalidationHandler:v23];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
  }
LABEL_7:

  return v12;
}

void __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _serializeEvent:v4];

  if ([WeakRetained _isBatchCompleted]) {
    [WeakRetained _completeBatch:*(void *)(a1 + 32)];
  }
}

void __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained curBatchSize]) {
    [WeakRetained _completeBatch:*(void *)(a1 + 32)];
  }
  uint64_t v4 = [WeakRetained flags];
  id v5 = [WeakRetained metadata];
  [v5 setFlags:v4];

  id v6 = [WeakRetained filterPredicate];
  id v7 = [v6 description];
  id v8 = [WeakRetained metadata];
  [v8 setFilterPredicateDescription:v7];

  uint64_t v9 = [WeakRetained maxLogEventBatchSize];
  id v10 = [WeakRetained metadata];
  [v10 setMaxLogEventBatchSize:v9];

  uint64_t v11 = [WeakRetained serializedEventCount];
  id v12 = [WeakRetained metadata];
  [v12 setSerializedEventCount:v11];

  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [WeakRetained metadata];
  uint64_t v15 = [v14 dataRepresentation];
  (*(void (**)(uint64_t, void *, uint64_t))(v13 + 16))(v13, v15, a2);
}

@end