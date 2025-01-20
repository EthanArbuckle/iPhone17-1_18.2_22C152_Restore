@interface MXCallStackThread
+ (BOOL)supportsSecureCoding;
- (BOOL)attributedThread;
- (MXCallStackThread)initWithCoder:(id)a3;
- (MXCallStackThread)initWithTopCallStackFrames:(id)a3 isAttributedThread:(BOOL)a4;
- (NSArray)topFrames;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXCallStackThread

- (MXCallStackThread)initWithTopCallStackFrames:(id)a3 isAttributedThread:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXCallStackThread;
  v8 = [(MXCallStackThread *)&v12 init];
  v9 = v8;
  if (v8)
  {
    if (!v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v8->_topFrames, a3);
    v9->_attributedThread = a4;
  }
  v10 = v9;
LABEL_6:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  topFrames = self->_topFrames;
  id v5 = a3;
  [v5 encodeObject:topFrames forKey:@"callStackRootFrames"];
  [v5 encodeBool:self->_attributedThread forKey:@"threadAttributed"];
}

- (MXCallStackThread)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXCallStackThread;
  id v5 = [(MXCallStackThread *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"callStackRootFrames"];
    topFrames = v5->_topFrames;
    v5->_topFrames = (NSArray *)v9;

    v5->_attributedThread = [v4 decodeBoolForKey:@"threadAttributed"];
  }

  return v5;
}

- (id)toDictionary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [NSNumber numberWithBool:self->_attributedThread];
  [v3 setObject:v4 forKey:@"threadAttributed"];

  if (self->_topFrames)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_topFrames;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "toDictionary", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"callStackRootFrames"];
  }

  return v3;
}

- (BOOL)attributedThread
{
  return self->_attributedThread;
}

- (NSArray)topFrames
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end