@interface _APUICardRequestCompactSatisfactionCriteria
- (BOOL)canSatisfyCardRequest:(id)a3;
- (unint64_t)servicePriorityForRequest:(id)a3;
@end

@implementation _APUICardRequestCompactSatisfactionCriteria

- (BOOL)canSatisfyCardRequest:(id)a3
{
  return [a3 format] == 2;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v4 = a3;
  if ([(_APUICardRequestCompactSatisfactionCriteria *)self canSatisfyCardRequest:v4])
  {
    unint64_t v5 = 2;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_APUICardRequestCompactSatisfactionCriteria;
    unint64_t v5 = [(APUICardRequestSatisfactionCriteria *)&v7 servicePriorityForRequest:v4];
  }

  return v5;
}

@end