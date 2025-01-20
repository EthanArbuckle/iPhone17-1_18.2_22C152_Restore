@interface MRURecommendation
+ (id)recommendationWithIRCandidateResult:(id)a3 contextIdentifier:(id)a4;
- (BOOL)isCallToAction;
- (BOOL)isConservativelyFiltered;
- (BOOL)isLockScreenControl;
- (MRIRRoute)route;
- (NSNumber)sortingHint;
- (NSString)contextIdentifier;
- (NSString)description;
- (NSString)reason;
- (int64_t)classification;
- (void)setCallToAction:(BOOL)a3;
- (void)setClassification:(int64_t)a3;
- (void)setConservativelyFiltered:(BOOL)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setLockScreenControl:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setRoute:(id)a3;
- (void)setSortingHint:(id)a3;
@end

@implementation MRURecommendation

+ (id)recommendationWithIRCandidateResult:(id)a3 contextIdentifier:(id)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F77058];
  id v7 = a4;
  v8 = [v5 candidate];
  v9 = [v6 routeWithCandidate:v8];

  [v9 setDonateAsCandidate:1];
  v10 = objc_opt_new();
  objc_msgSend(v10, "setClassification:", objc_msgSend(v5, "classification"));
  if (objc_opt_respondsToSelector())
  {
    v11 = [v5 sortingHint];
    [v10 setSortingHint:v11];
  }
  [v10 setRoute:v9];
  [v10 setContextIdentifier:v7];

  objc_msgSend(v10, "setConservativelyFiltered:", objc_msgSend(v5, "isConservativeFiltered"));
  SEL v12 = NSSelectorFromString(&cfstr_Classification_0.isa);
  if (objc_opt_respondsToSelector())
  {
    v13 = [v5 performSelector:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setReason:v13];
    }
  }

  return v10;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ (%p): ", v5, self];

  id v7 = [(MRURecommendation *)self route];
  v8 = [v7 routeIdentifier];
  [v6 appendFormat:@"routeIdentififer: %@", v8];

  int64_t v9 = [(MRURecommendation *)self classification];
  if ((unint64_t)(v9 - 1) > 3) {
    v10 = @"Unknown";
  }
  else {
    v10 = off_1E5F0EAA0[v9 - 1];
  }
  [v6 appendFormat:@", classification: %@", v10];
  v11 = [(MRURecommendation *)self contextIdentifier];
  [v6 appendFormat:@", contextIdentifier: %@", v11];

  if ([(MRURecommendation *)self isConservativelyFiltered]) {
    [v6 appendString:@", ConservativelyFiltered"];
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSNumber)sortingHint
{
  return self->_sortingHint;
}

- (void)setSortingHint:(id)a3
{
}

- (BOOL)isCallToAction
{
  return self->_callToAction;
}

- (void)setCallToAction:(BOOL)a3
{
  self->_callToAction = a3;
}

- (BOOL)isLockScreenControl
{
  return self->_lockScreenControl;
}

- (void)setLockScreenControl:(BOOL)a3
{
  self->_lockScreenControl = a3;
}

- (BOOL)isConservativelyFiltered
{
  return self->_conservativelyFiltered;
}

- (void)setConservativelyFiltered:(BOOL)a3
{
  self->_conservativelyFiltered = a3;
}

- (MRIRRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_sortingHint, 0);
}

@end