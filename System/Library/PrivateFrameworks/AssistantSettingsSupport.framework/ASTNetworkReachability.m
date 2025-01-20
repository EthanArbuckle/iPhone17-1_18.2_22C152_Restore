@interface ASTNetworkReachability
+ (BOOL)hasExpensiveCellOnlyNetworkConnection;
+ (BOOL)hasNetworkConnection;
+ (id)defaultPath;
@end

@implementation ASTNetworkReachability

+ (BOOL)hasNetworkConnection
{
  v2 = [a1 defaultPath];
  BOOL v3 = nw_path_get_status(v2) == nw_path_status_satisfied;

  return v3;
}

+ (BOOL)hasExpensiveCellOnlyNetworkConnection
{
  v2 = [a1 defaultPath];
  BOOL v3 = nw_path_get_status(v2) == nw_path_status_satisfied
    && nw_path_is_expensive(v2)
    && nw_path_uses_interface_type(v2, nw_interface_type_cellular);

  return v3;
}

+ (id)defaultPath
{
  default_evaluator = (void *)nw_path_create_default_evaluator();
  BOOL v3 = (void *)nw_path_evaluator_copy_path();

  return v3;
}

@end