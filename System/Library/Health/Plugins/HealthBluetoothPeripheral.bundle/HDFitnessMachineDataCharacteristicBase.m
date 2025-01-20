@interface HDFitnessMachineDataCharacteristicBase
+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4;
+ (id)uuid;
+ (unsigned)flagFieldLength;
- (BOOL)elapsedTimeIsSet;
- (NSArray)allFields;
- (id)generateDatums:(id)a3;
- (id)getBinaryValueWithError:(id *)a3;
- (unsigned)elapsedTime;
@end

@implementation HDFitnessMachineDataCharacteristicBase

+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)a1) _init];
  id v7 = v5;
  id v23 = [v7 bytes];
  v8 = (char *)[v7 length] + (void)v23;
  unsigned int v9 = [a1 flagFieldLength];
  if (v9 == 3)
  {
    uint64_t v10 = +[HDHealthServiceCharacteristic uint24FromData:&v23 before:v8];
    goto LABEL_5;
  }
  if (v9 == 2)
  {
    uint64_t v10 = +[HDHealthServiceCharacteristic uint16FromData:&v23 before:v8];
LABEL_5:
    uint64_t v11 = v10;
    goto LABEL_7;
  }
  uint64_t v11 = 0;
LABEL_7:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = objc_msgSend(v6, "allFields", 0);
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v17 isIncludedInFlags:v11]) {
          [v17 setValueWithBytes:&v23 before:v8];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }

  return v6;
}

- (id)getBinaryValueWithError:(id *)a3
{
  v4 = +[NSMutableData data];
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(HDFitnessMachineDataCharacteristicBase *)self allFields];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v11 correspondingFlagBit];
        if ([v11 flagFieldFlipped])
        {
          v12 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v11 correspondingFlagBit]);
          unsigned __int8 v13 = [v5 containsObject:v12];

          if ((v13 & 1) == 0)
          {
            id v14 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v11 correspondingFlagBit]);
            [v5 addObject:v14];
          }
        }
        uint64_t v15 = [v11 valueAsData];
        [v4 appendData:v15];
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)generateDatums:(id)a3
{
  return &__NSDictionary0__struct;
}

- (BOOL)elapsedTimeIsSet
{
  return 0;
}

- (unsigned)elapsedTime
{
  return 0;
}

- (NSArray)allFields
{
  return (NSArray *)&__NSArray0__struct;
}

+ (id)uuid
{
  sub_1B478();
  sub_1B45C();
  id v2 = objc_alloc_init((Class)CBUUID);

  return v2;
}

+ (unsigned)flagFieldLength
{
  return 0;
}

@end