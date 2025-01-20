@interface ADSyncChunkInfo
- (NSArray)toAdd;
- (NSArray)toRemove;
- (NSString)post;
- (NSString)pre;
- (NSString)validity;
- (void)setPost:(id)a3;
- (void)setPre:(id)a3;
- (void)setToAdd:(id)a3;
- (void)setToRemove:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation ADSyncChunkInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toRemove, 0);
  objc_storeStrong((id *)&self->_toAdd, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_pre, 0);
}

- (void)setToRemove:(id)a3
{
}

- (NSArray)toRemove
{
  return self->_toRemove;
}

- (void)setToAdd:(id)a3
{
}

- (NSArray)toAdd
{
  return self->_toAdd;
}

- (void)setValidity:(id)a3
{
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setPost:(id)a3
{
}

- (NSString)post
{
  return self->_post;
}

- (void)setPre:(id)a3
{
}

- (NSString)pre
{
  return self->_pre;
}

@end