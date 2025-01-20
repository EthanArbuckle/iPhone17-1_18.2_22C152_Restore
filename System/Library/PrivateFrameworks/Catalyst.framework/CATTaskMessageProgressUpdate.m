@interface CATTaskMessageProgressUpdate
+ (BOOL)supportsSecureCoding;
- (CATTaskMessageProgressUpdate)initWithCoder:(id)a3;
- (CATTaskMessageProgressUpdate)initWithTaskUUID:(id)a3 progress:(id)a4;
- (CATTaskProgress)progress;
- (void)encodeWithCoder:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation CATTaskMessageProgressUpdate

- (CATTaskMessageProgressUpdate)initWithTaskUUID:(id)a3 progress:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CATTaskMessageProgressUpdate;
  v7 = [(CATTaskMessage *)&v11 initWithTaskUUID:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    progress = v7->_progress;
    v7->_progress = (CATTaskProgress *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessageProgressUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTaskMessageProgressUpdate;
  v5 = [(CATTaskMessage *)&v10 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"progress"];
    progress = v5->_progress;
    v5->_progress = (CATTaskProgress *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CATTaskMessageProgressUpdate;
  id v4 = a3;
  [(CATTaskMessage *)&v6 encodeWithCoder:v4];
  v5 = [(CATTaskMessageProgressUpdate *)self progress];
  [v4 encodeObject:v5 forKey:@"progress"];
}

- (CATTaskProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end