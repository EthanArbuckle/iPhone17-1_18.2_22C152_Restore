@interface PDURLOperationStats
- (id)failedPayloadsCountsDictionary;
- (id)successPayloadsCountsDictionary;
- (void)_incrementCounterForKey:(id)a3 inDictionary:(id)a4;
@end

@implementation PDURLOperationStats

- (void)_incrementCounterForKey:(id)a3 inDictionary:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = [v5 valueForKey:v9];
  v7 = v6;
  if (v6)
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v6 integerValue] + 1);
    v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &off_10020AE60;
  }
  [v5 setValue:v8 forKey:v9];
}

- (id)successPayloadsCountsDictionary
{
  if (self->_haveEEPayloads)
  {
    uint64_t v2 = 24;
LABEL_5:
    id v3 = *(id *)((char *)&self->super.isa + v2);
    goto LABEL_6;
  }
  if (self->_haveOrionPayloads)
  {
    uint64_t v2 = 40;
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_6:

  return v3;
}

- (id)failedPayloadsCountsDictionary
{
  if (self->_haveEEPayloads)
  {
    uint64_t v2 = 32;
LABEL_5:
    id v3 = *(id *)((char *)&self->super.isa + v2);
    goto LABEL_6;
  }
  if (self->_haveOrionPayloads)
  {
    uint64_t v2 = 48;
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_6:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startProcessingDate, 0);
  objc_storeStrong((id *)&self->_orionPayloadCountsFailed, 0);
  objc_storeStrong((id *)&self->_orionPayloadCounts, 0);
  objc_storeStrong((id *)&self->_eePayloadCountsFailed, 0);
  objc_storeStrong((id *)&self->_eePayloadCounts, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end