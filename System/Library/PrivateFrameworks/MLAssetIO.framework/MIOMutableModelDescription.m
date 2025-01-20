@interface MIOMutableModelDescription
- (void)setShortDescription:(id)a3 forInputFeatureWithName:(id)a4;
- (void)setShortDescription:(id)a3 forInputFeatureWithName:(id)a4 functionName:(id)a5;
- (void)setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4;
- (void)setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4 functionName:(id)a5;
- (void)setShortDescription:(id)a3 forStateFeatureWithName:(id)a4;
- (void)setShortDescription:(id)a3 forStateFeatureWithName:(id)a4 functionName:(id)a5;
@end

@implementation MIOMutableModelDescription

- (void)setShortDescription:(id)a3 forInputFeatureWithName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(MIOModelDescription *)self defaultFunctionName];
  [(MIOModelDescription *)self _setShortDescription:v8 forInputFeatureWithName:v6 functionName:v7];
}

- (void)setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(MIOModelDescription *)self defaultFunctionName];
  [(MIOModelDescription *)self _setShortDescription:v8 forOutputFeatureWithName:v6 functionName:v7];
}

- (void)setShortDescription:(id)a3 forStateFeatureWithName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(MIOModelDescription *)self defaultFunctionName];
  [(MIOModelDescription *)self _setShortDescription:v8 forStateFeatureWithName:v6 functionName:v7];
}

- (void)setShortDescription:(id)a3 forInputFeatureWithName:(id)a4 functionName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v13;
  id v11 = v9;
  id v12 = v9;
  if (!v9)
  {
    id v12 = [(MIOModelDescription *)self defaultFunctionName];
    id v10 = v13;
  }
  [(MIOModelDescription *)self _setShortDescription:v10 forInputFeatureWithName:v8 functionName:v12];
  if (!v11) {
}
  }

- (void)setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4 functionName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v13;
  id v11 = v9;
  id v12 = v9;
  if (!v9)
  {
    id v12 = [(MIOModelDescription *)self defaultFunctionName];
    id v10 = v13;
  }
  [(MIOModelDescription *)self _setShortDescription:v10 forOutputFeatureWithName:v8 functionName:v12];
  if (!v11) {
}
  }

- (void)setShortDescription:(id)a3 forStateFeatureWithName:(id)a4 functionName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v13;
  id v11 = v9;
  id v12 = v9;
  if (!v9)
  {
    id v12 = [(MIOModelDescription *)self defaultFunctionName];
    id v10 = v13;
  }
  [(MIOModelDescription *)self _setShortDescription:v10 forStateFeatureWithName:v8 functionName:v12];
  if (!v11) {
}
  }

@end