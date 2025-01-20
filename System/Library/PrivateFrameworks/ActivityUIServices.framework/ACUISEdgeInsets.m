@interface ACUISEdgeInsets
+ (BOOL)supportsSecureCoding;
- (ACUISEdgeInsets)init;
- (ACUISEdgeInsets)initWithCoder:(id)a3;
- (ACUISEdgeInsets)initWithTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6;
- (BOOL)isEqual:(id)a3;
- (double)bottom;
- (double)leading;
- (double)top;
- (double)trailing;
- (id)_edgeInsets;
- (id)_initWithEdgeInsets:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBottom:(double)a3;
- (void)setLeading:(double)a3;
- (void)setTop:(double)a3;
- (void)setTrailing:(double)a3;
@end

@implementation ACUISEdgeInsets

- (id)_initWithEdgeInsets:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACUISEdgeInsets;
  v6 = [(ACUISEdgeInsets *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_edgeInsets, a3);
  }

  return v7;
}

- (ACUISEdgeInsets)init
{
  v3 = objc_alloc_init(_TtC18ActivityUIServices18ActivityEdgeInsets);
  v4 = [(ACUISEdgeInsets *)self _initWithEdgeInsets:v3];

  return v4;
}

- (ACUISEdgeInsets)initWithTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6
{
  v10 = [(ACUISEdgeInsets *)self init];
  v11 = v10;
  if (v10)
  {
    [(ActivityEdgeInsets *)v10->_edgeInsets setTop:a3];
    [(ActivityEdgeInsets *)v11->_edgeInsets setLeading:a4];
    [(ActivityEdgeInsets *)v11->_edgeInsets setBottom:a5];
    [(ActivityEdgeInsets *)v11->_edgeInsets setTrailing:a6];
  }
  return v11;
}

- (double)top
{
  [(ActivityEdgeInsets *)self->_edgeInsets top];
  return result;
}

- (void)setTop:(double)a3
{
}

- (double)leading
{
  [(ActivityEdgeInsets *)self->_edgeInsets leading];
  return result;
}

- (void)setLeading:(double)a3
{
}

- (double)bottom
{
  [(ActivityEdgeInsets *)self->_edgeInsets bottom];
  return result;
}

- (void)setBottom:(double)a3
{
}

- (double)trailing
{
  [(ActivityEdgeInsets *)self->_edgeInsets trailing];
  return result;
}

- (void)setTrailing:(double)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ACUISEdgeInsets *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ActivityEdgeInsets *)self->_edgeInsets isEqual:v4->_edgeInsets];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(ActivityEdgeInsets *)self->_edgeInsets hash];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_edgeInsets withName:@"insets"];
  BOOL v5 = [v3 build];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ACUISEdgeInsets alloc];
  BOOL v5 = (void *)[(ActivityEdgeInsets *)self->_edgeInsets copy];
  id v6 = [(ACUISEdgeInsets *)v4 _initWithEdgeInsets:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISEdgeInsets)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"insets"];

  id v6 = [(ACUISEdgeInsets *)self _initWithEdgeInsets:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)_edgeInsets
{
  return self->_edgeInsets;
}

- (void).cxx_destruct
{
}

@end