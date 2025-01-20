@interface SFSafariViewControllerPrewarmingToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSOrderedSet)URLs;
- (SFSafariViewControllerPrewarmingToken)initWithCoder:(id)a3;
- (SFSafariViewControllerPrewarmingToken)initWithURLs:(id)a3;
- (unint64_t)requestID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation SFSafariViewControllerPrewarmingToken

- (SFSafariViewControllerPrewarmingToken)initWithURLs:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFSafariViewControllerPrewarmingToken;
  v6 = [(SFSafariViewControllerPrewarmingToken *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URLs, a3);
    v7->_valid = 1;
    uint64_t v8 = initWithURLs__requestID++;
    v7->_requestID = v8;
    v9 = v7;
  }

  return v7;
}

- (void)invalidate
{
  if (self->_valid)
  {
    self->_valid = 0;
    id v3 = +[_SFSafariViewControllerPrewarmingSession sharedSessionIfExists];
    [v3 tokenWithIDDidInvalidate:self->_requestID];
  }
}

- (void)dealloc
{
  [(SFSafariViewControllerPrewarmingToken *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFSafariViewControllerPrewarmingToken;
  [(SFSafariViewControllerPrewarmingToken *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFSafariViewControllerPrewarmingToken *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = [(NSOrderedSet *)self->_URLs isEqualToOrderedSet:v5->_URLs]
        && self->_valid == v5->_valid
        && self->_requestID == v5->_requestID;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSafariViewControllerPrewarmingToken)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFSafariViewControllerPrewarmingToken;
  id v5 = [(SFSafariViewControllerPrewarmingToken *)&v13 init];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"URLs"];
    URLs = v5->_URLs;
    v5->_URLs = (NSOrderedSet *)v9;

    v5->_valid = [v4 decodeBoolForKey:@"valid"];
    v5->_requestID = [v4 decodeIntegerForKey:@"requestID"];
    objc_super v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  URLs = self->_URLs;
  id v5 = a3;
  [v5 encodeObject:URLs forKey:@"URLs"];
  [v5 encodeBool:self->_valid forKey:@"valid"];
  [v5 encodeInteger:self->_requestID forKey:@"requestID"];
}

- (NSOrderedSet)URLs
{
  return self->_URLs;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
}

@end