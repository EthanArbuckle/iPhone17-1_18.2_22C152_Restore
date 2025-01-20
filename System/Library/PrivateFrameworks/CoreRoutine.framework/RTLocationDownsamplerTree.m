@interface RTLocationDownsamplerTree
- (NSArray)locations;
- (RTLocationDownsamplerTree)init;
- (RTLocationDownsamplerTree)initWithLocations:(id)a3 errorFunction:(id)a4;
- (RTLocationDownsamplerTree)left;
- (RTLocationDownsamplerTree)right;
- (double)evaluateLocationsWithErrorFunction:(id)a3;
- (double)maximumError;
- (id)allLocations;
- (id)description;
- (id)sampledLocations;
- (unint64_t)maximumErrorIndex;
- (void)setLeft:(id)a3;
- (void)setLocations:(id)a3;
- (void)setMaximumError:(double)a3;
- (void)setMaximumErrorIndex:(unint64_t)a3;
- (void)setRight:(id)a3;
- (void)splitLocationsWithErrorFunction:(id)a3;
@end

@implementation RTLocationDownsamplerTree

- (RTLocationDownsamplerTree)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocations_errorFunction_);
}

- (RTLocationDownsamplerTree)initWithLocations:(id)a3 errorFunction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RTLocationDownsamplerTree;
  v9 = [(RTLocationDownsamplerTree *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locations, a3);
    [(RTLocationDownsamplerTree *)v10 evaluateLocationsWithErrorFunction:v8];
    v10->_maximumError = v11;
  }

  return v10;
}

- (double)evaluateLocationsWithErrorFunction:(id)a3
{
  v4 = (double (**)(id, void *, void *))a3;
  v5 = [(RTLocationDownsamplerTree *)self locations];
  unint64_t v6 = [v5 count] & 0xFFFFFFFFFFFFFFFELL;

  if (v6 == 2)
  {
    unint64_t v7 = 0;
    double v8 = 0.0;
  }
  else
  {
    unint64_t v7 = 0;
    double v8 = 0.0;
    unint64_t v9 = 1;
    do
    {
      v10 = [(RTLocationDownsamplerTree *)self locations];
      double v11 = [v10 objectAtIndex:v9];

      v12 = [(RTLocationDownsamplerTree *)self locations];
      double v13 = v4[2](v4, v11, v12);

      if (v13 > v8)
      {
        unint64_t v7 = v9;
        double v8 = v13;
      }

      ++v9;
      v14 = [(RTLocationDownsamplerTree *)self locations];
      unint64_t v15 = [v14 count] - 2;
    }
    while (v9 < v15);
  }
  [(RTLocationDownsamplerTree *)self setMaximumError:v8];
  [(RTLocationDownsamplerTree *)self setMaximumErrorIndex:v7];

  return v8;
}

- (void)splitLocationsWithErrorFunction:(id)a3
{
  id v28 = a3;
  v4 = [(RTLocationDownsamplerTree *)self locations];

  if (!v4)
  {
    double v8 = [(RTLocationDownsamplerTree *)self left];
    if ([(RTLocationDownsamplerTree *)self maximumErrorIndex])
    {
      uint64_t v15 = [(RTLocationDownsamplerTree *)self right];

      double v8 = (void *)v15;
    }
    [v8 splitLocationsWithErrorFunction:v28];
    goto LABEL_7;
  }
  v5 = [(RTLocationDownsamplerTree *)self locations];
  unint64_t v6 = [v5 count];

  if (v6 >= 3)
  {
    unint64_t v7 = [(RTLocationDownsamplerTree *)self locations];
    double v8 = objc_msgSend(v7, "subarrayWithRange:", 0, -[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex") + 1);

    unint64_t v9 = [(RTLocationDownsamplerTree *)self locations];
    unint64_t v10 = [(RTLocationDownsamplerTree *)self maximumErrorIndex];
    double v11 = [(RTLocationDownsamplerTree *)self locations];
    v12 = objc_msgSend(v9, "subarrayWithRange:", v10, objc_msgSend(v11, "count") - -[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex"));

    double v13 = [[RTLocationDownsamplerTree alloc] initWithLocations:v8 errorFunction:v28];
    v14 = [[RTLocationDownsamplerTree alloc] initWithLocations:v12 errorFunction:v28];
    [(RTLocationDownsamplerTree *)self setLeft:v13];
    [(RTLocationDownsamplerTree *)self setRight:v14];
    [(RTLocationDownsamplerTree *)self setLocations:0];

LABEL_7:
    v16 = [(RTLocationDownsamplerTree *)self left];
    [v16 maximumError];
    double v18 = v17;

    v19 = [(RTLocationDownsamplerTree *)self right];
    [v19 maximumError];
    double v21 = v20;

    if (v18 >= v21) {
      double v22 = v18;
    }
    else {
      double v22 = v21;
    }
    [(RTLocationDownsamplerTree *)self setMaximumError:v22];
    v23 = [(RTLocationDownsamplerTree *)self left];
    [v23 maximumError];
    double v25 = v24;
    v26 = [(RTLocationDownsamplerTree *)self right];
    [v26 maximumError];
    [(RTLocationDownsamplerTree *)self setMaximumErrorIndex:v25 <= v27];
  }
}

- (id)allLocations
{
  uint64_t v3 = [(RTLocationDownsamplerTree *)self left];
  if (v3
    && (v4 = (void *)v3,
        [(RTLocationDownsamplerTree *)self right],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    unint64_t v6 = objc_opt_new();
    unint64_t v7 = [(RTLocationDownsamplerTree *)self left];
    double v8 = [v7 allLocations];

    unint64_t v9 = [(RTLocationDownsamplerTree *)self right];
    unint64_t v10 = [v9 allLocations];

    double v11 = objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
    [v6 addObjectsFromArray:v11];

    [v6 addObjectsFromArray:v10];
  }
  else
  {
    unint64_t v6 = [(RTLocationDownsamplerTree *)self locations];
  }
  return v6;
}

- (id)sampledLocations
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTLocationDownsamplerTree *)self left];
  if (v3
    && (v4 = (void *)v3,
        [(RTLocationDownsamplerTree *)self right],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    unint64_t v6 = objc_opt_new();
    unint64_t v7 = [(RTLocationDownsamplerTree *)self left];
    double v8 = [v7 sampledLocations];

    unint64_t v9 = [(RTLocationDownsamplerTree *)self right];
    unint64_t v10 = [v9 sampledLocations];

    double v11 = objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
    [v6 addObjectsFromArray:v11];

    [v6 addObjectsFromArray:v10];
  }
  else
  {
    double v8 = [(RTLocationDownsamplerTree *)self locations];
    unint64_t v10 = [v8 firstObject];
    v15[0] = v10;
    v12 = [(RTLocationDownsamplerTree *)self locations];
    double v13 = [v12 lastObject];
    v15[1] = v13;
    unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  }
  return v6;
}

- (id)description
{
  uint64_t v3 = [(RTLocationDownsamplerTree *)self left];
  if (v3
    && (v4 = (void *)v3,
        [(RTLocationDownsamplerTree *)self right],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    unint64_t v6 = NSString;
    [(RTLocationDownsamplerTree *)self maximumError];
    uint64_t v8 = v7;
    unint64_t v9 = [(RTLocationDownsamplerTree *)self maximumErrorIndex];
    unint64_t v10 = [(RTLocationDownsamplerTree *)self left];
    double v11 = [v10 description];
    v12 = [(RTLocationDownsamplerTree *)self right];
    double v13 = [v12 description];
    v14 = [v6 stringWithFormat:@"{ME:%f,MI:%lu,left:[%@],right:[%@]}", v8, v9, v11, v13];
  }
  else
  {
    uint64_t v15 = [(RTLocationDownsamplerTree *)self locations];
    v16 = [v15 valueForKey:@"description"];
    unint64_t v10 = [v16 componentsJoinedByString:@"),("];

    double v17 = NSString;
    [(RTLocationDownsamplerTree *)self maximumError];
    v14 = [v17 stringWithFormat:@"{ME:%f,MI:%lu,locs:(%@)}", v18, -[RTLocationDownsamplerTree maximumErrorIndex](self, "maximumErrorIndex"), v10];
  }

  return v14;
}

- (RTLocationDownsamplerTree)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
}

- (RTLocationDownsamplerTree)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (double)maximumError
{
  return self->_maximumError;
}

- (void)setMaximumError:(double)a3
{
  self->_maximumError = a3;
}

- (unint64_t)maximumErrorIndex
{
  return self->_maximumErrorIndex;
}

- (void)setMaximumErrorIndex:(unint64_t)a3
{
  self->_maximumErrorIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

@end