@interface C3DBinding
- (NSDictionary)options;
- (NSString)keyPathDst;
- (NSString)keyPathSrc;
- (id)sourceObject;
- (void)dealloc;
- (void)setKeyPathDst:(id)a3;
- (void)setKeyPathSrc:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSourceObject:(id)a3;
@end

@implementation C3DBinding

- (void)dealloc
{
  [(C3DBinding *)self setSourceObject:0];
  [(C3DBinding *)self setKeyPathSrc:0];
  [(C3DBinding *)self setKeyPathDst:0];
  [(C3DBinding *)self setOptions:0];
  v3.receiver = self;
  v3.super_class = (Class)C3DBinding;
  [(C3DBinding *)&v3 dealloc];
}

- (id)sourceObject
{
  return self->sourceObject;
}

- (void)setSourceObject:(id)a3
{
}

- (NSString)keyPathSrc
{
  return self->keyPathSrc;
}

- (void)setKeyPathSrc:(id)a3
{
}

- (NSString)keyPathDst
{
  return self->keyPathDst;
}

- (void)setKeyPathDst:(id)a3
{
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
}

@end