@interface DAMoveAction
+ (BOOL)supportsSecureCoding;
- (DAMoveAction)initWithCoder:(id)a3;
- (DAMoveAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 sourceContainerId:(id)a5 sourceServerId:(id)a6 destinationContainerId:(id)a7;
- (NSString)destinationContainerId;
- (NSString)sourceContainerId;
- (NSString)sourceServerId;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationContainerId:(id)a3;
- (void)setSourceContainerId:(id)a3;
- (void)setSourceServerId:(id)a3;
@end

@implementation DAMoveAction

- (DAMoveAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 sourceContainerId:(id)a5 sourceServerId:(id)a6 destinationContainerId:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)DAMoveAction;
  v15 = [(DAAction *)&v18 initWithItemChangeType:a3 changedItem:a4 serverId:0];
  v16 = v15;
  if (v15)
  {
    [(DAMoveAction *)v15 setSourceContainerId:v12];
    [(DAMoveAction *)v16 setSourceServerId:v13];
    [(DAMoveAction *)v16 setDestinationContainerId:v14];
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAMoveAction)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"DAAction.m" lineNumber:157 description:@"Who does non-keyed coding nowadays?"];
  }
  v12.receiver = self;
  v12.super_class = (Class)DAMoveAction;
  v6 = [(DAAction *)&v12 initWithCoder:v5];
  if (v6)
  {
    v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAASourceContainerId"];
    [(DAMoveAction *)v6 setSourceContainerId:v7];

    v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAASourceServerId"];
    [(DAMoveAction *)v6 setSourceServerId:v8];

    v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAADestinationContainerId"];
    [(DAMoveAction *)v6 setDestinationContainerId:v9];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"DAAction.m" lineNumber:168 description:@"Who does non-keyed coding nowadays?"];
  }
  v10.receiver = self;
  v10.super_class = (Class)DAMoveAction;
  [(DAAction *)&v10 encodeWithCoder:v5];
  v6 = [(DAMoveAction *)self sourceContainerId];
  [v5 encodeObject:v6 forKey:@"DAASourceContainerId"];

  v7 = [(DAMoveAction *)self sourceServerId];
  [v5 encodeObject:v7 forKey:@"DAASourceServerId"];

  v8 = [(DAMoveAction *)self destinationContainerId];
  [v5 encodeObject:v8 forKey:@"DAADestinationContainerId"];
}

- (NSString)sourceContainerId
{
  return self->_sourceContainerId;
}

- (void)setSourceContainerId:(id)a3
{
}

- (NSString)sourceServerId
{
  return self->_sourceServerId;
}

- (void)setSourceServerId:(id)a3
{
}

- (NSString)destinationContainerId
{
  return self->_destinationContainerId;
}

- (void)setDestinationContainerId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationContainerId, 0);
  objc_storeStrong((id *)&self->_sourceServerId, 0);
  objc_storeStrong((id *)&self->_sourceContainerId, 0);
}

@end