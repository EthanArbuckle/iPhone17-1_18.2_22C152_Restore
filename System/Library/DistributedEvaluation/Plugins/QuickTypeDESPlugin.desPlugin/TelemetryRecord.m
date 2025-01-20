@interface TelemetryRecord
- (TelemetryRecord)init;
- (id)summary;
- (unint64_t)mailCount;
- (unint64_t)messageCount;
- (unint64_t)sentenceInMailCount;
- (unint64_t)sentenceInMessagesCount;
- (void)setMailCount:(unint64_t)a3;
- (void)setMessageCount:(unint64_t)a3;
- (void)setSentenceInMailCount:(unint64_t)a3;
- (void)setSentenceInMessagesCount:(unint64_t)a3;
- (void)updateWithMessageTokens:(id)a3 andSource:(int64_t)a4;
@end

@implementation TelemetryRecord

- (TelemetryRecord)init
{
  v8.receiver = self;
  v8.super_class = (Class)TelemetryRecord;
  v2 = [(TelemetryRecord *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)[&off_19D40 mutableCopy];
    tokenBuckets = v2->_tokenBuckets;
    v2->_tokenBuckets = v3;

    v5 = (NSMutableDictionary *)[&off_19D68 mutableCopy];
    unkRateBuckets = v2->_unkRateBuckets;
    v2->_unkRateBuckets = v5;
  }
  return v2;
}

- (void)updateWithMessageTokens:(id)a3 andSource:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    [(TelemetryRecord *)self setMessageCount:(char *)[(TelemetryRecord *)self messageCount] + 1];
  }
  else if (a4 == 2)
  {
    [(TelemetryRecord *)self setMailCount:(char *)[(TelemetryRecord *)self mailCount] + 1];
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = 0;
    NSUInteger v10 = 0;
    uint64_t v11 = *(void *)v50;
    uint64_t v38 = *(void *)v50;
    int64_t v39 = a4;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v9 += [v13 isOOV];
        ++v10;
        if ([v13 tokenID] == 2)
        {
          if (a4 == 1)
          {
            [(TelemetryRecord *)self setSentenceInMessagesCount:(char *)[(TelemetryRecord *)self sentenceInMessagesCount] + 1];
          }
          else if (a4 == 2)
          {
            [(TelemetryRecord *)self setSentenceInMailCount:(char *)[(TelemetryRecord *)self sentenceInMailCount] + 1];
          }
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          v14 = [(NSMutableDictionary *)self->_tokenBuckets allKeys];
          id v15 = [v14 countByEnumeratingWithState:&v45 objects:v54 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v46;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v46 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(NSString **)(*((void *)&v45 + 1) + 8 * (void)j);
                NSRange v20 = NSRangeFromString(v19);
                if (v10 >= v20.location && v10 - v20.location < v20.length)
                {
                  v22 = [(NSMutableDictionary *)self->_tokenBuckets objectForKeyedSubscript:v19];
                  v23 = (char *)[v22 unsignedIntegerValue];

                  v24 = +[NSNumber numberWithUnsignedInteger:v23 + 1];
                  [(NSMutableDictionary *)self->_tokenBuckets setObject:v24 forKeyedSubscript:v19];

                  goto LABEL_27;
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v45 objects:v54 count:16];
            }
            while (v16);
          }
LABEL_27:

          if (v10) {
            float v25 = (float)((float)v9 / (float)v10) * 100.0;
          }
          else {
            float v25 = 0.0;
          }
          a4 = v39;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v26 = [(NSMutableDictionary *)self->_unkRateBuckets allKeys];
          id v27 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
          if (v27)
          {
            id v28 = v27;
            NSUInteger v29 = (unint64_t)v25;
            uint64_t v30 = *(void *)v42;
            do
            {
              for (k = 0; k != v28; k = (char *)k + 1)
              {
                if (*(void *)v42 != v30) {
                  objc_enumerationMutation(v26);
                }
                v32 = *(NSString **)(*((void *)&v41 + 1) + 8 * (void)k);
                NSRange v33 = NSRangeFromString(v32);
                if (v29 >= v33.location && v29 - v33.location < v33.length)
                {
                  v35 = [(NSMutableDictionary *)self->_unkRateBuckets objectForKeyedSubscript:v32];
                  v36 = (char *)[v35 unsignedIntegerValue];

                  v37 = +[NSNumber numberWithUnsignedInteger:v36 + 1];
                  [(NSMutableDictionary *)self->_unkRateBuckets setObject:v37 forKeyedSubscript:v32];

                  goto LABEL_42;
                }
              }
              id v28 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
            }
            while (v28);
          }
LABEL_42:

          unint64_t v9 = 0;
          NSUInteger v10 = 0;
          uint64_t v11 = v38;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v8);
  }
}

- (id)summary
{
  id v3 = objc_alloc_init((Class)NSNumberFormatter);
  [v3 setRoundingMode:4];
  [v3 setMaximumSignificantDigits:2];
  v16[0] = @"messagesCount";
  v4 = +[NSNumber numberWithUnsignedInteger:[(TelemetryRecord *)self messageCount]];
  v5 = [v3 stringFromNumber:v4];
  v17[0] = v5;
  v16[1] = @"mailsCount";
  id v6 = +[NSNumber numberWithUnsignedInteger:[(TelemetryRecord *)self mailCount]];
  id v7 = [v3 stringFromNumber:v6];
  v17[1] = v7;
  v16[2] = @"sentenceCountForMessages";
  id v8 = +[NSNumber numberWithUnsignedInteger:[(TelemetryRecord *)self sentenceInMessagesCount]];
  unint64_t v9 = [v3 stringFromNumber:v8];
  v17[2] = v9;
  v16[3] = @"sentenceCountForMail";
  NSUInteger v10 = +[NSNumber numberWithUnsignedInteger:[(TelemetryRecord *)self sentenceInMailCount]];
  uint64_t v11 = [v3 stringFromNumber:v10];
  tokenBuckets = self->_tokenBuckets;
  unkRateBuckets = self->_unkRateBuckets;
  v17[3] = v11;
  v17[4] = tokenBuckets;
  v16[4] = @"tokenCount";
  v16[5] = @"unkRate";
  v17[5] = unkRateBuckets;
  v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

- (unint64_t)messageCount
{
  return self->_messageCount;
}

- (void)setMessageCount:(unint64_t)a3
{
  self->_messageCount = a3;
}

- (unint64_t)mailCount
{
  return self->_mailCount;
}

- (void)setMailCount:(unint64_t)a3
{
  self->_mailCount = a3;
}

- (unint64_t)sentenceInMessagesCount
{
  return self->_sentenceInMessagesCount;
}

- (void)setSentenceInMessagesCount:(unint64_t)a3
{
  self->_sentenceInMessagesCount = a3;
}

- (unint64_t)sentenceInMailCount
{
  return self->_sentenceInMailCount;
}

- (void)setSentenceInMailCount:(unint64_t)a3
{
  self->_sentenceInMailCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unkRateBuckets, 0);

  objc_storeStrong((id *)&self->_tokenBuckets, 0);
}

@end