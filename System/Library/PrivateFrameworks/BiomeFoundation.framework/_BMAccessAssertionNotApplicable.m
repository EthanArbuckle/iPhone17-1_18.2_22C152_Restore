@interface _BMAccessAssertionNotApplicable
- (BMAccessDescriptor)descriptor;
- (BMResourceContainer)container;
- (NSString)path;
- (_BMAccessAssertionNotApplicable)initWithDescriptor:(id)a3 container:(id)a4;
@end

@implementation _BMAccessAssertionNotApplicable

- (_BMAccessAssertionNotApplicable)initWithDescriptor:(id)a3 container:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_BMAccessAssertionNotApplicable;
  v9 = [(_BMAccessAssertionNotApplicable *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    v11 = [v7 resource];
    uint64_t v12 = +[BMPaths pathForResource:v11 inContainer:v8];
    path = v10->_path;
    v10->_path = (NSString *)v12;

    objc_storeStrong((id *)&v10->_container, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (BMAccessDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSString)path
{
  return self->_path;
}

- (BMResourceContainer)container
{
  return self->_container;
}

@end