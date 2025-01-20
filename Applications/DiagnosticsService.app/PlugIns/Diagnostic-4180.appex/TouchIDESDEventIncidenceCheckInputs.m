@interface TouchIDESDEventIncidenceCheckInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSDictionary)biokitOptions;
- (void)setBiokitOptions:(id)a3;
@end

@implementation TouchIDESDEventIncidenceCheckInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v9 = 0;
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  v6 = [v4 dk_numberFromKey:@"kEsdMonitorTimeout" lowerBound:&off_100004338 upperBound:&off_100004350 defaultValue:0 failed:&v9];

  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:@"kEsdMonitorTimeout"];
  }
  [(TouchIDESDEventIncidenceCheckInputs *)self setBiokitOptions:v5];
  BOOL v7 = v9 == 0;

  return v7;
}

- (NSDictionary)biokitOptions
{
  return self->_biokitOptions;
}

- (void)setBiokitOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end