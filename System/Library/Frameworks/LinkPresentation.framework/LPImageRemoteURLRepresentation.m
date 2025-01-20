@interface LPImageRemoteURLRepresentation
- (LPImageRemoteURLRepresentation)initWithScale:(unint64_t)a3 URL:(id)a4;
- (NSURL)URL;
- (unint64_t)scale;
@end

@implementation LPImageRemoteURLRepresentation

- (LPImageRemoteURLRepresentation)initWithScale:(unint64_t)a3 URL:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPImageRemoteURLRepresentation;
  v8 = [(LPImageRemoteURLRepresentation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_scale = a3;
    objc_storeStrong((id *)&v8->_URL, a4);
    v10 = v9;
  }

  return v9;
}

- (unint64_t)scale
{
  return self->_scale;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end