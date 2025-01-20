@interface _DASActivityProgressWrapper
+ (BOOL)supportsSecureCoding;
- (NSProgress)progress;
- (_DASActivityProgressWrapper)initWithCoder:(id)a3;
- (_DASActivityProgressWrapper)initWithProgress:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation _DASActivityProgressWrapper

- (_DASActivityProgressWrapper)initWithProgress:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASActivityProgressWrapper;
  v6 = [(_DASActivityProgressWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_progress, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASActivityProgressWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_DASActivityProgressWrapper;
  id v5 = [(_DASActivityProgressWrapper *)&v21 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F90]);
    objc_msgSend(v6, "setTotalUnitCount:", objc_msgSend(v4, "decodeInt64ForKey:", @"total"));
    objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v4, "decodeInt64ForKey:", @"completed"));
    if ([v4 decodeInt64ForKey:@"cancelled"]) {
      [v6 cancel];
    }
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"userInfo"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __45___DASActivityProgressWrapper_initWithCoder___block_invoke;
    v19[3] = &unk_1E6112D38;
    v15 = (NSProgress *)v6;
    v20 = v15;
    [v14 enumerateKeysAndObjectsUsingBlock:v19];
    progress = v5->_progress;
    v5->_progress = v15;
    v17 = v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  progress = self->_progress;
  id v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", -[NSProgress completedUnitCount](progress, "completedUnitCount"), @"completed");
  objc_msgSend(v5, "encodeInt64:forKey:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"), @"total");
  objc_msgSend(v5, "encodeBool:forKey:", -[NSProgress isCancelled](self->_progress, "isCancelled"), @"cancelled");
  id v6 = [(NSProgress *)self->_progress userInfo];
  [v5 encodeObject:v6 forKey:@"userInfo"];
}

- (id)description
{
  v2 = [(_DASActivityProgressWrapper *)self progress];
  v3 = [v2 description];

  return v3;
}

- (NSProgress)progress
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