@interface CLCppContainer
+ (BOOL)supportsSecureCoding;
+ (id)containerWithObject:(void *)a3 destructor:(id)a4 binaryVersion:(unint64_t)a5 typeSize:(unint64_t)a6;
- (CLCppContainer)initWithCoder:(id)a3;
- (CLCppContainer)initWithObject:(void *)a3 destructor:(id)a4 binaryVersion:(unint64_t)a5 typeSize:(unint64_t)a6;
- (const)cppObjectPtr;
- (id)destructor;
- (unint64_t)binaryVersion;
- (unint64_t)sizeOfType;
- (void)dealloc;
- (void)invalidate;
- (void)setCppObjectPtr:(const void *)a3;
- (void)setDestructor:(id)a3;
@end

@implementation CLCppContainer

+ (id)containerWithObject:(void *)a3 destructor:(id)a4 binaryVersion:(unint64_t)a5 typeSize:(unint64_t)a6
{
  id v9 = a4;
  v10 = [[CLCppContainer alloc] initWithObject:a3 destructor:v9 binaryVersion:a5 typeSize:a6];

  return v10;
}

- (CLCppContainer)initWithObject:(void *)a3 destructor:(id)a4 binaryVersion:(unint64_t)a5 typeSize:(unint64_t)a6
{
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLCppContainer;
  v11 = [(CLCppContainer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(CLCppContainer *)v11 setCppObjectPtr:a3];
    [(CLCppContainer *)v12 setDestructor:v10];
    v12->_binaryVersion = a5;
    v12->_sizeOfType = a6;
  }

  return v12;
}

- (void)setCppObjectPtr:(const void *)a3
{
  self->_cppObjectPtr = a3;
}

- (void)dealloc
{
  v3 = [(CLCppContainer *)self destructor];

  if (v3)
  {
    v4 = [(CLCppContainer *)self destructor];
    v4[2]();
  }
  [(CLCppContainer *)self setDestructor:0];
  v5.receiver = self;
  v5.super_class = (Class)CLCppContainer;
  [(CLCppContainer *)&v5 dealloc];
}

- (id)destructor
{
  return self->_destructor;
}

- (void)setDestructor:(id)a3
{
}

- (unint64_t)sizeOfType
{
  return self->_sizeOfType;
}

- (unint64_t)binaryVersion
{
  return self->_binaryVersion;
}

- (const)cppObjectPtr
{
  return self->_cppObjectPtr;
}

- (void).cxx_destruct
{
}

- (void)invalidate
{
  v3 = [(CLCppContainer *)self destructor];

  if (v3)
  {
    v4 = [(CLCppContainer *)self destructor];
    v4[2]();
  }
  [(CLCppContainer *)self setDestructor:0];
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (CLCppContainer)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLCppContainer;
  return [(CLCppContainer *)&v4 init];
}

@end