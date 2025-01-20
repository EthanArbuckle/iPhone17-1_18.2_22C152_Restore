@interface _MKFUserActivityStatus
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (MKFUserActivityStatusDatabaseID)databaseID;
@end

@implementation _MKFUserActivityStatus

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFUserActivityStatus"];
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_MKFUserActivityStatus;
  BOOL v5 = -[_MKFModel validateForInsertOrUpdate:](&v14, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    v6 = [(_MKFUserActivityStatus *)self user];
    if (v6)
    {
    }
    else
    {
      v7 = [(_MKFUserActivityStatus *)self guest];

      if (!v7)
      {
        if (a3)
        {
          v11 = @"user or guest is required";
          goto LABEL_12;
        }
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    uint64_t v8 = [(_MKFUserActivityStatus *)self user];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_MKFUserActivityStatus *)self guest];

      if (v10)
      {
        if (a3)
        {
          v11 = @"Both user and guest must not be set";
LABEL_12:
          objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", v11);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = 0;
          *a3 = v12;
          return v5;
        }
        goto LABEL_13;
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (MKFUserActivityStatusDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFUserActivityStatusDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5321D0;
}

@end