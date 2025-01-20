@interface ACDataclassAction
+ (BOOL)supportsSecureCoding;
+ (id)_actionForError:(id)a3;
+ (id)actionWithType:(int64_t)a3;
+ (id)destructiveActionWithType:(int64_t)a3;
+ (id)destructiveActionWithType:(int64_t)a3 affectedContainers:(id)a4;
- (ACDataclassAction)initWithCoder:(id)a3;
- (ACDataclassAction)initWithType:(int64_t)a3 destructivity:(BOOL)a4 affectedContainers:(id)a5;
- (BOOL)_isError;
- (BOOL)isDestructive;
- (BOOL)isEqual:(id)a3;
- (NSArray)affectedContainers;
- (NSString)description;
- (NSString)undoAlertMessage;
- (NSString)undoAlertTitle;
- (id)_encodeProtobuf;
- (id)_encodeProtobufData;
- (id)_initWithProtobuf:(id)a3;
- (id)_initWithProtobufData:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUndoAlertMessage:(id)a3;
- (void)setUndoAlertTitle:(id)a3;
@end

@implementation ACDataclassAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithType:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:a3 destructivity:0 affectedContainers:0];

  return v3;
}

+ (id)destructiveActionWithType:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:a3 destructivity:1 affectedContainers:0];

  return v3;
}

+ (id)destructiveActionWithType:(int64_t)a3 affectedContainers:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:a3 destructivity:1 affectedContainers:v6];

  return v7;
}

+ (id)_actionForError:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:0 destructivity:1 affectedContainers:0];

  return v3;
}

- (ACDataclassAction)initWithType:(int64_t)a3 destructivity:(BOOL)a4 affectedContainers:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ACDataclassAction;
  v10 = [(ACDataclassAction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_isDestructive = a4;
    objc_storeStrong((id *)&v10->_affectedContainers, a5);
  }

  return v11;
}

- (ACDataclassAction)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACDataclassAction;
  v5 = [(ACDataclassAction *)&v18 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 integerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destructive"];
    v5->_isDestructive = [v7 BOOLValue];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"affectedContainers"];
    affectedContainers = v5->_affectedContainers;
    v5->_affectedContainers = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertReasonTitle"];
    undoAlertTitle = v5->_undoAlertTitle;
    v5->_undoAlertTitle = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertReasonMessage"];
    undoAlertMessage = v5->_undoAlertMessage;
    v5->_undoAlertMessage = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [NSNumber numberWithInteger:self->_type];
  [v8 encodeObject:v4 forKey:@"type"];

  v5 = [NSNumber numberWithBool:self->_isDestructive];
  [v8 encodeObject:v5 forKey:@"destructive"];

  [v8 encodeObject:self->_affectedContainers forKey:@"affectedContainers"];
  undoAlertTitle = self->_undoAlertTitle;
  if (undoAlertTitle) {
    [v8 encodeObject:undoAlertTitle forKey:@"alertReasonTitle"];
  }
  undoAlertMessage = self->_undoAlertMessage;
  if (undoAlertMessage) {
    [v8 encodeObject:undoAlertMessage forKey:@"alertReasonMessage"];
  }
}

- (id)_initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [(ACDataclassAction *)self init];
  if (v5)
  {
    id v6 = v4;
    v5->_type = (int)[v6 type];
    v5->_isDestructive = [v6 destructive];
    v7 = [v6 affectedContainers];
    uint64_t v8 = [v7 copy];
    affectedContainers = v5->_affectedContainers;
    v5->_affectedContainers = (NSArray *)v8;

    v10 = [v6 undoAlertTitle];
    uint64_t v11 = [v10 copy];
    undoAlertTitle = v5->_undoAlertTitle;
    v5->_undoAlertTitle = (NSString *)v11;

    uint64_t v13 = [v6 undoAlertMessage];

    uint64_t v14 = [v13 copy];
    undoAlertMessage = v5->_undoAlertMessage;
    v5->_undoAlertMessage = (NSString *)v14;

    v16 = v5;
  }

  return v5;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ACDataclassAction.m", 86, @"Invalid parameter not satisfying: %@", @"data.length != 0" object file lineNumber description];
  }
  if ([v5 length])
  {
    id v6 = [[ACProtobufDataclassAction alloc] initWithData:v5];
    if (v6)
    {
      self = (ACDataclassAction *)[(ACDataclassAction *)self _initWithProtobuf:v6];
      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_encodeProtobuf
{
  v3 = objc_opt_new();
  [v3 setType:LODWORD(self->_type)];
  [v3 setDestructive:self->_isDestructive];
  id v4 = (void *)[(NSArray *)self->_affectedContainers mutableCopy];
  [v3 setAffectedContainers:v4];

  id v5 = (void *)[(NSString *)self->_undoAlertTitle copy];
  [v3 setUndoAlertTitle:v5];

  id v6 = (void *)[(NSString *)self->_undoAlertMessage copy];
  [v3 setUndoAlertMessage:v6];

  return v3;
}

- (id)_encodeProtobufData
{
  v2 = [(ACDataclassAction *)self _encodeProtobuf];
  v3 = [v2 data];

  return v3;
}

- (NSString)description
{
  unint64_t v2 = [(ACDataclassAction *)self type];
  if (v2 > 8) {
    return (NSString *)@"Unknown ACDataclassAction";
  }
  else {
    return (NSString *)off_1E5BCECD0[v2];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(ACDataclassAction *)self type];
    BOOL v8 = 0;
    if (v6 == [v5 type])
    {
      affectedContainers = self->_affectedContainers;
      if (affectedContainers == (NSArray *)v5[3] || -[NSArray isEqual:](affectedContainers, "isEqual:")) {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)_isError
{
  return !self->_type && self->_isDestructive;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (NSArray)affectedContainers
{
  return self->_affectedContainers;
}

- (NSString)undoAlertTitle
{
  return self->_undoAlertTitle;
}

- (void)setUndoAlertTitle:(id)a3
{
}

- (NSString)undoAlertMessage
{
  return self->_undoAlertMessage;
}

- (void)setUndoAlertMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoAlertMessage, 0);
  objc_storeStrong((id *)&self->_undoAlertTitle, 0);

  objc_storeStrong((id *)&self->_affectedContainers, 0);
}

@end