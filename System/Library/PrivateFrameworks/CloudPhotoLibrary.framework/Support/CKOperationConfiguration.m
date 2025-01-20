@interface CKOperationConfiguration
- (BOOL)cplDiscretionary;
- (void)setCPLDiscretionary:(BOOL)a3;
@end

@implementation CKOperationConfiguration

- (BOOL)cplDiscretionary
{
  return [(CKOperationConfiguration *)self discretionaryNetworkBehavior] != 0;
}

- (void)setCPLDiscretionary:(BOOL)a3
{
  if (a3) {
    [(CKOperationConfiguration *)self setDiscretionaryNetworkBehavior:2];
  }
  else {
    [(CKOperationConfiguration *)self setDiscretionaryNetworkBehavior:0];
  }
}

@end