@interface DBGMatrix3
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withMatrix3:(_OWORD *)a3;
- (NSString)debugDescription;
- (NSString)description;
- (__n128)initWithMatrix3:(uint64_t)a3;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)matrix3;
- (void)setMatrix3:(const void *)a3;
@end

@implementation DBGMatrix3

+ (id)withMatrix3:(_OWORD *)a3
{
  id v4 = [a1 alloc];
  long long v5 = a3[3];
  v10[2] = a3[2];
  v10[3] = v5;
  long long v6 = a3[5];
  v10[4] = a3[4];
  v10[5] = v6;
  long long v7 = a3[1];
  v10[0] = *a3;
  v10[1] = v7;
  id v8 = [v4 initWithMatrix3:v10];

  return v8;
}

- (__n128)initWithMatrix3:(uint64_t)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)DBGMatrix3;
  id v4 = [(DBGMatrix3 *)&v9 init];
  if (v4)
  {
    DBGMatrix3 v6 = *(DBGMatrix3 *)(a3 + 16);
    v4[1] = *(DBGMatrix3 *)a3;
    v4[2] = v6;
    __n128 result = *(__n128 *)(a3 + 32);
    DBGMatrix3 v7 = *(DBGMatrix3 *)(a3 + 48);
    DBGMatrix3 v8 = *(DBGMatrix3 *)(a3 + 80);
    v4[5] = *(DBGMatrix3 *)(a3 + 64);
    v4[6] = v8;
    v4[3] = (DBGMatrix3)result;
    v4[4] = v7;
  }
  return result;
}

- (id)objectValue
{
  [(DBGMatrix3 *)self matrix3];
  v3 = +[NSNumber numberWithDouble:v22];
  v23[0] = v3;
  [(DBGMatrix3 *)self matrix3];
  id v4 = +[NSNumber numberWithDouble:v21];
  v23[1] = v4;
  [(DBGMatrix3 *)self matrix3];
  long long v5 = +[NSNumber numberWithDouble:v20];
  v23[2] = v5;
  [(DBGMatrix3 *)self matrix3];
  DBGMatrix3 v6 = +[NSNumber numberWithDouble:v19];
  v23[3] = v6;
  [(DBGMatrix3 *)self matrix3];
  DBGMatrix3 v7 = +[NSNumber numberWithDouble:v18];
  v23[4] = v7;
  [(DBGMatrix3 *)self matrix3];
  DBGMatrix3 v8 = +[NSNumber numberWithDouble:v17];
  v23[5] = v8;
  [(DBGMatrix3 *)self matrix3];
  objc_super v9 = +[NSNumber numberWithDouble:v16];
  v23[6] = v9;
  [(DBGMatrix3 *)self matrix3];
  v10 = +[NSNumber numberWithDouble:v15];
  v23[7] = v10;
  [(DBGMatrix3 *)self matrix3];
  v11 = +[NSNumber numberWithDouble:v14];
  v23[8] = v11;
  v12 = +[NSArray arrayWithObjects:v23 count:9];

  return v12;
}

- (NSString)description
{
  v2 = [(DBGMatrix3 *)self objectValue];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  long long v5 = [(DBGMatrix3 *)self description];
  DBGMatrix3 v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)matrix3
{
}

- (void)setMatrix3:(const void *)a3
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  double v7 = matrix_identity_double3x3.columns[0].f64[3];
  double v8 = matrix_identity_double3x3.columns[1].f64[3];
  double v9 = matrix_identity_double3x3.columns[2].f64[3];
  uint64_t v68 = 0;
  v10 = DBGDecodeValueFromJSONCompatibleValue();
  id v11 = 0;
  v13 = v11;
  if (v11)
  {
    double v14 = matrix_identity_double3x3.columns[0].f64[2];
    int8x16_t v15 = *(int8x16_t *)matrix_identity_double3x3.columns[0].f64;
    unint64_t v16 = vextq_s8(v15, v15, 8uLL).u64[0];
    double v17 = matrix_identity_double3x3.columns[1].f64[2];
    int8x16_t v18 = *(int8x16_t *)matrix_identity_double3x3.columns[1].f64;
    unint64_t v19 = vextq_s8(v18, v18, 8uLL).u64[0];
    *(double *)&long long v12 = matrix_identity_double3x3.columns[2].f64[2];
    int8x16_t v20 = *(int8x16_t *)matrix_identity_double3x3.columns[2].f64;
    unint64_t v21 = vextq_s8(v20, v20, 8uLL).u64[0];
    if (a5)
    {
      unint64_t v56 = v16;
      double v52 = matrix_identity_double3x3.columns[1].f64[0];
      double v54 = matrix_identity_double3x3.columns[0].f64[2];
      double v48 = matrix_identity_double3x3.columns[1].f64[2];
      unint64_t v50 = v19;
      unint64_t v44 = v21;
      double v46 = matrix_identity_double3x3.columns[2].f64[0];
      long long v43 = v12;
      id v22 = v11;
      *(void *)&long long v12 = v43;
      unint64_t v21 = v44;
      *(double *)v20.i64 = v46;
      double v17 = v48;
      unint64_t v19 = v50;
      *(double *)v18.i64 = v52;
      double v14 = v54;
      unint64_t v16 = v56;
      v15.i64[0] = *(void *)&matrix_identity_double3x3.columns[0].f64[0];
      *a5 = v22;
    }
  }
  else
  {
    v23 = [v10 objectAtIndexedSubscript:0];
    [v23 doubleValue];
    uint64_t v58 = v24;

    v25 = [v10 objectAtIndexedSubscript:1];
    [v25 doubleValue];
    unint64_t v57 = v26;

    v27 = [v10 objectAtIndexedSubscript:2];
    [v27 doubleValue];
    double v55 = v28;

    v29 = [v10 objectAtIndexedSubscript:4];
    [v29 doubleValue];
    uint64_t v53 = v30;

    v31 = [v10 objectAtIndexedSubscript:5];
    [v31 doubleValue];
    unint64_t v51 = v32;

    v33 = [v10 objectAtIndexedSubscript:6];
    [v33 doubleValue];
    double v49 = v34;

    v35 = [v10 objectAtIndexedSubscript:8];
    [v35 doubleValue];
    uint64_t v47 = v36;

    v37 = [v10 objectAtIndexedSubscript:9];
    [v37 doubleValue];
    unint64_t v45 = v38;

    v39 = [v10 objectAtIndexedSubscript:10];
    [v39 doubleValue];
    long long v43 = v40;

    *(void *)&long long v12 = v43;
    unint64_t v21 = v45;
    v20.i64[0] = v47;
    double v17 = v49;
    unint64_t v19 = v51;
    v18.i64[0] = v53;
    double v14 = v55;
    unint64_t v16 = v57;
    v15.i64[0] = v58;
  }
  double v60 = v14;
  v15.i64[1] = v16;
  int8x16_t v59 = v15;
  double v61 = v7;
  double v63 = v17;
  v18.i64[1] = v19;
  int8x16_t v62 = v18;
  double v64 = v8;
  uint64_t v66 = v12;
  v20.i64[1] = v21;
  int8x16_t v65 = v20;
  double v67 = v9;
  v41 = objc_msgSend(a1, "withMatrix3:", &v59, v43);

  return v41;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGMatrix3 *)self matrix3];
  v3 = +[NSNumber numberWithDouble:v22];
  v23[0] = v3;
  [(DBGMatrix3 *)self matrix3];
  id v4 = +[NSNumber numberWithDouble:v21];
  v23[1] = v4;
  [(DBGMatrix3 *)self matrix3];
  long long v5 = +[NSNumber numberWithDouble:v20];
  v23[2] = v5;
  [(DBGMatrix3 *)self matrix3];
  DBGMatrix3 v6 = +[NSNumber numberWithDouble:v19];
  v23[3] = v6;
  [(DBGMatrix3 *)self matrix3];
  double v7 = +[NSNumber numberWithDouble:v18];
  v23[4] = v7;
  [(DBGMatrix3 *)self matrix3];
  double v8 = +[NSNumber numberWithDouble:v17];
  v23[5] = v8;
  [(DBGMatrix3 *)self matrix3];
  double v9 = +[NSNumber numberWithDouble:v16];
  v23[6] = v9;
  [(DBGMatrix3 *)self matrix3];
  v10 = +[NSNumber numberWithDouble:v15];
  v23[7] = v10;
  [(DBGMatrix3 *)self matrix3];
  id v11 = +[NSNumber numberWithDouble:v14];
  v23[8] = v11;
  long long v12 = +[NSArray arrayWithObjects:v23 count:9];

  return v12;
}

@end