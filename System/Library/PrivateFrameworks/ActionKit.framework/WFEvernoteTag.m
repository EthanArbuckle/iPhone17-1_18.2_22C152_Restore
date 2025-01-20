@interface WFEvernoteTag
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (NSNumber)updateSequenceNum;
- (NSString)guid;
- (NSString)name;
- (NSString)parentGuid;
- (WFEvernoteTag)initWithCoder:(id)a3;
- (WFEvernoteTag)initWithGUID:(id)a3 name:(id)a4 parentGuid:(id)a5 updateSequenceNum:(id)a6;
- (WFEvernoteTag)initWithTag:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGuid:(id)a3;
- (void)setName:(id)a3;
- (void)setParentGuid:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
@end

@implementation WFEvernoteTag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_parentGuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setParentGuid:(id)a3
{
}

- (NSString)parentGuid
{
  return self->_parentGuid;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (WFEvernoteTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guid"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentGuid"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateSequenceNum"];

  v9 = [(WFEvernoteTag *)self initWithGUID:v5 name:v6 parentGuid:v7 updateSequenceNum:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFEvernoteTag *)self guid];
  [v4 encodeObject:v5 forKey:@"guid"];

  v6 = [(WFEvernoteTag *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  v7 = [(WFEvernoteTag *)self parentGuid];
  [v4 encodeObject:v7 forKey:@"parentGuid"];

  id v8 = [(WFEvernoteTag *)self updateSequenceNum];
  [v4 encodeObject:v8 forKey:@"updateSequenceNum"];
}

- (WFEvernoteTag)initWithTag:(id)a3
{
  id v4 = a3;
  v5 = [v4 guid];
  v6 = [v4 name];
  v7 = [v4 parentGuid];
  id v8 = [v4 updateSequenceNum];

  v9 = [(WFEvernoteTag *)self initWithGUID:v5 name:v6 parentGuid:v7 updateSequenceNum:v8];
  return v9;
}

- (WFEvernoteTag)initWithGUID:(id)a3 name:(id)a4 parentGuid:(id)a5 updateSequenceNum:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFEvernoteTag;
  v14 = [(WFEvernoteTag *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    guid = v14->_guid;
    v14->_guid = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    name = v14->_name;
    v14->_name = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    parentGuid = v14->_parentGuid;
    v14->_parentGuid = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    updateSequenceNum = v14->_updateSequenceNum;
    v14->_updateSequenceNum = (NSNumber *)v21;

    v23 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v5 = +[WFDiskCache workflowCache];
    uint64_t v2 = objc_opt_class();
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    [v5 setClass:v2 forCachedClassName:v4];
  }
}

@end