@interface DBGInsets
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withEdgeInsets:(DBGEdgeInsets)a3;
- (DBGEdgeInsets)edgeInsets;
- (DBGInsets)initWithEdgeInsets:(DBGEdgeInsets)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setEdgeInsets:(DBGEdgeInsets)a3;
@end

@implementation DBGInsets

+ (id)withEdgeInsets:(DBGEdgeInsets)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)a1), "initWithEdgeInsets:", a3.top, a3.leading, a3.bottom, a3.trailing);

  return v3;
}

- (DBGInsets)initWithEdgeInsets:(DBGEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)DBGInsets;
  result = [(DBGInsets *)&v8 init];
  if (result)
  {
    result->_edgeInsets.double top = top;
    result->_edgeInsets.double leading = leading;
    result->_edgeInsets.double bottom = bottom;
    result->_edgeInsets.double trailing = trailing;
  }
  return result;
}

- (id)objectValue
{
  [(DBGInsets *)self edgeInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  objc_super v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v14[0] = v8;
  v9 = +[NSNumber numberWithDouble:v3];
  v14[1] = v9;
  v10 = +[NSNumber numberWithDouble:v5];
  v14[2] = v10;
  v11 = +[NSNumber numberWithDouble:v7];
  v14[3] = v11;
  v12 = +[NSArray arrayWithObjects:v14 count:4];

  return v12;
}

- (NSString)description
{
  double v2 = [(DBGInsets *)self objectValue];
  double v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  double v5 = [(DBGInsets *)self description];
  double v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (DBGEdgeInsets)edgeInsets
{
  objc_copyStruct(v6, &self->_edgeInsets, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (void)setEdgeInsets:(DBGEdgeInsets)a3
{
  DBGEdgeInsets v3 = a3;
  objc_copyStruct(&self->_edgeInsets, &v3, 32, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  double v7 = DBGDecodeValueFromJSONCompatibleValue();
  id v8 = 0;
  v9 = v8;
  if (v8)
  {
    double v10 = 0.0;
    if (a5) {
      *a5 = v8;
    }
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
  }
  else
  {
    v14 = [v7 objectAtIndexedSubscript:0];
    [v14 doubleValue];
    double v13 = v15;
    v16 = [v7 objectAtIndexedSubscript:1];
    [v16 doubleValue];
    double v12 = v17;
    v18 = [v7 objectAtIndexedSubscript:2];
    [v18 doubleValue];
    double v11 = v19;
    v20 = [v7 objectAtIndexedSubscript:3];
    [v20 doubleValue];
    double v10 = v21;
  }
  v22 = objc_msgSend(a1, "withEdgeInsets:", v13, v12, v11, v10);

  return v22;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGInsets *)self edgeInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v14[0] = v8;
  v9 = +[NSNumber numberWithDouble:v3];
  v14[1] = v9;
  double v10 = +[NSNumber numberWithDouble:v5];
  v14[2] = v10;
  double v11 = +[NSNumber numberWithDouble:v7];
  v14[3] = v11;
  double v12 = +[NSArray arrayWithObjects:v14 count:4];

  return v12;
}

@end