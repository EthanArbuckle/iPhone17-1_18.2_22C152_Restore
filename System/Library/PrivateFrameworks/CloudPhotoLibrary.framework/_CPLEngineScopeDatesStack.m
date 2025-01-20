@interface _CPLEngineScopeDatesStack
- (void)prependDate:(void *)a3 forKey:;
@end

@implementation _CPLEngineScopeDatesStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedKey, 0);
  objc_storeStrong((id *)&self->_intermediateStatuses, 0);
  objc_storeStrong((id *)&self->_lastDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
  objc_storeStrong((id *)&self->_now, 0);
}

- (void)prependDate:(void *)a3 forKey:
{
  id v18 = a2;
  id v6 = a3;
  if (a1 && v18)
  {
    if (*(void *)(a1 + 16))
    {
      v7 = _displayableKey(v6);
      [*(id *)(a1 + 16) timeIntervalSinceDate:v18];
      double v9 = v8;
      if (v8 > 1.0)
      {
        objc_storeStrong((id *)(a1 + 16), a2);
        v10 = *(void **)(a1 + 32);
        id v11 = [NSString alloc];
        v12 = +[CPLDateFormatter stringForTimeInterval:v9];
        v13 = (void *)[v11 initWithFormat:@"%@ ... %@ ...", v7, v12];
        [v10 insertObject:v13 atIndex:0];

LABEL_9:
        goto LABEL_10;
      }
      if (v8 >= 0.0)
      {
        v17 = *(void **)(a1 + 32);
        v12 = (void *)[[NSString alloc] initWithFormat:@"%@ ...", v7];
        [v17 insertObject:v12 atIndex:0];
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      v15 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v14;

      objc_storeStrong((id *)(a1 + 16), a2);
      objc_storeStrong((id *)(a1 + 24), a2);
      objc_storeStrong((id *)(a1 + 40), a3);
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v16;
    }
LABEL_10:
  }
}

@end