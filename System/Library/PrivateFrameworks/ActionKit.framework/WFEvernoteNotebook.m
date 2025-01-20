@interface WFEvernoteNotebook
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (NSString)guid;
- (NSString)name;
- (WFEvernoteNotebook)initWithCoder:(id)a3;
- (WFEvernoteNotebook)initWithGUID:(id)a3 name:(id)a4;
- (WFEvernoteNotebook)initWithNotebook:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGuid:(id)a3;
- (void)setName:(id)a3;
@end

@implementation WFEvernoteNotebook

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
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

- (WFEvernoteNotebook)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"guid"])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guid"];
    goto LABEL_9;
  }
  if ([v4 containsValueForKey:@"notebook"])
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notebook"];
    uint64_t v7 = [v6 guid];
LABEL_7:
    v5 = (void *)v7;

    goto LABEL_9;
  }
  if ([v4 containsValueForKey:@"sharedNotebook"])
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedNotebook"];
    uint64_t v7 = [v6 notebookGuid];
    goto LABEL_7;
  }
  v5 = 0;
LABEL_9:
  if ([v4 containsValueForKey:@"name"])
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  }
  else
  {
    if ([v4 containsValueForKey:@"notebook"])
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notebook"];
      uint64_t v10 = [v9 name];
    }
    else
    {
      if (![v4 containsValueForKey:@"linkedNotebook"])
      {
        v8 = 0;
        goto LABEL_17;
      }
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkedNotebook"];
      uint64_t v10 = [v9 shareName];
    }
    v8 = (void *)v10;
  }
LABEL_17:
  v11 = [(WFEvernoteNotebook *)self initWithGUID:v5 name:v8];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFEvernoteNotebook *)self guid];
  [v4 encodeObject:v5 forKey:@"guid"];

  id v6 = [(WFEvernoteNotebook *)self name];
  [v4 encodeObject:v6 forKey:@"name"];
}

- (WFEvernoteNotebook)initWithNotebook:(id)a3
{
  id v4 = a3;
  v5 = [v4 notebook];
  id v6 = [v5 guid];
  uint64_t v7 = [v4 name];

  v8 = [(WFEvernoteNotebook *)self initWithGUID:v6 name:v7];
  return v8;
}

- (WFEvernoteNotebook)initWithGUID:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFEvernoteNotebook;
  v8 = [(WFEvernoteNotebook *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    guid = v8->_guid;
    v8->_guid = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[WFDiskCache workflowCache];
    uint64_t v3 = objc_opt_class();
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [v2 setClass:v3 forCachedClassName:v5];

    id v6 = +[WFDiskCache workflowCache];
    uint64_t v7 = objc_opt_class();
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v6 setClass:v7 forCachedClassName:v9];

    uint64_t v10 = +[WFDiskCache workflowCache];
    uint64_t v11 = objc_opt_class();
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v10 setClass:v11 forCachedClassName:v13];

    id v17 = +[WFDiskCache workflowCache];
    uint64_t v14 = objc_opt_class();
    objc_super v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v17 setClass:v14 forCachedClassName:v16];
  }
}

@end