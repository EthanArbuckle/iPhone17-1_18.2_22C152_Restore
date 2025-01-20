@interface CKKSSelves
- (CKKSSelfPeer)currentSelf;
- (CKKSSelves)initWithCurrent:(id)a3 allSelves:(id)a4;
- (NSSet)allSelves;
- (id)description;
- (void)setAllSelves:(id)a3;
- (void)setCurrentSelf:(id)a3;
@end

@implementation CKKSSelves

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSelves, 0);

  objc_storeStrong((id *)&self->_currentSelf, 0);
}

- (void)setAllSelves:(id)a3
{
}

- (NSSet)allSelves
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentSelf:(id)a3
{
}

- (CKKSSelfPeer)currentSelf
{
  return (CKKSSelfPeer *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = [(CKKSSelves *)self allSelves];
  v4 = (__CFString *)[v3 mutableCopy];

  v5 = [(CKKSSelves *)self currentSelf];
  [(__CFString *)v4 removeObject:v5];

  v6 = [(CKKSSelves *)self currentSelf];
  id v7 = [(__CFString *)v4 count];
  CFStringRef v8 = @"(no past selves)";
  if (v7) {
    CFStringRef v8 = v4;
  }
  v9 = +[NSString stringWithFormat:@"<CKKSSelves: %@ %@>", v6, v8];

  return v9;
}

- (CKKSSelves)initWithCurrent:(id)a3 allSelves:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKKSSelves;
  v9 = [(CKKSSelves *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentSelf, a3);
    if (v8)
    {
      uint64_t v11 = [v8 setByAddingObject:v7];
    }
    else
    {
      if (v7) {
        +[NSSet setWithObject:v7];
      }
      else {
      uint64_t v11 = +[NSSet set];
      }
    }
    allSelves = v10->_allSelves;
    v10->_allSelves = (NSSet *)v11;
  }
  return v10;
}

@end