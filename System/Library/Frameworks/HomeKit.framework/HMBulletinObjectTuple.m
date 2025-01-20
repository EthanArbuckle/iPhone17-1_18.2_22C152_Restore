@interface HMBulletinObjectTuple
+ (id)tupleWithQueryType:(int64_t)a3 uuidString:(id)a4;
- (HMBulletinObjectTuple)initWithQueryType:(int64_t)a3 uuidString:(id)a4;
- (NSString)queryName;
- (NSString)uuidString;
@end

@implementation HMBulletinObjectTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);

  objc_storeStrong((id *)&self->_queryName, 0);
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (NSString)queryName
{
  return self->_queryName;
}

- (HMBulletinObjectTuple)initWithQueryType:(int64_t)a3 uuidString:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMBulletinObjectTuple;
  v7 = [(HMBulletinObjectTuple *)&v15 init];
  v8 = v7;
  switch(a3)
  {
    case 0:
      queryName = v7->_queryName;
      v10 = @"home";
      goto LABEL_11;
    case 1:
      queryName = v7->_queryName;
      v10 = @"accessory";
      goto LABEL_11;
    case 2:
      queryName = v7->_queryName;
      v10 = @"service";
      goto LABEL_11;
    case 3:
      queryName = v7->_queryName;
      v10 = @"characteristic";
      goto LABEL_11;
    case 4:
      queryName = v7->_queryName;
      v10 = @"invitation";
      goto LABEL_11;
    case 5:
      queryName = v7->_queryName;
      v10 = @"accessoryProfile";
      goto LABEL_11;
    case 6:
      queryName = v7->_queryName;
      v10 = @"trigger";
      goto LABEL_11;
    case 7:
      v11 = v7->_queryName;
      v7->_queryName = (NSString *)@"tab";

      uuidString = v8->_uuidString;
      v8->_uuidString = (NSString *)@"home";
      goto LABEL_12;
    case 8:
      queryName = v7->_queryName;
      v10 = @"firmwareUpdate";
LABEL_11:
      v7->_queryName = &v10->isa;

      uint64_t v13 = [v6 copy];
      uuidString = v8->_uuidString;
      v8->_uuidString = (NSString *)v13;
LABEL_12:

      break;
    default:
      break;
  }

  return v8;
}

+ (id)tupleWithQueryType:(int64_t)a3 uuidString:(id)a4
{
  id v5 = a4;
  id v6 = [[HMBulletinObjectTuple alloc] initWithQueryType:a3 uuidString:v5];

  return v6;
}

@end