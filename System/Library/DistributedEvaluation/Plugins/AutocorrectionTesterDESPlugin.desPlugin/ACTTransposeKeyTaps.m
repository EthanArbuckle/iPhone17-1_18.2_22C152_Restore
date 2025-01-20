@interface ACTTransposeKeyTaps
- (ACTTransposeKeyTaps)initWithFirstTap:(id)a3 secondTap:(id)a4;
- (ACTUserAction)firstTap;
- (ACTUserAction)secondTap;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTTransposeKeyTaps

- (ACTTransposeKeyTaps)initWithFirstTap:(id)a3 secondTap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACTTransposeKeyTaps;
  v9 = [(ACTTransposeKeyTaps *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstTap, a3);
    objc_storeStrong((id *)&v10->_secondTap, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ACTTransposeKeyTaps *)self firstTap];
  v6 = [(ACTTransposeKeyTaps *)self secondTap];
  id v7 = +[NSString stringWithFormat:@"<%@: firstTap=%@, secondTap=%@>", v4, v5, v6];

  return v7;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACTTransposeKeyTaps *)self firstTap];
  [v8 applyWithTyper:v7 log:v6];

  id v9 = [(ACTTransposeKeyTaps *)self secondTap];
  [v9 applyWithTyper:v7 log:v6];
}

- (id)shortDescription
{
  v2 = [(ACTUserAction *)self twoKeyTapShortDescription];
  v3 = +[NSString stringWithFormat:@"Transpose first/second: %@ ", v2];

  return v3;
}

- (ACTUserAction)firstTap
{
  return self->_firstTap;
}

- (ACTUserAction)secondTap
{
  return self->_secondTap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondTap, 0);

  objc_storeStrong((id *)&self->_firstTap, 0);
}

@end