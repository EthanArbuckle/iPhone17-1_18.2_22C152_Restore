@interface TDFacetDefinition
- (id)dateOfLastChange;
- (id)keySpec;
- (void)copyAttributesInto:(id)a3;
- (void)setDateOfLastChange:(id)a3;
@end

@implementation TDFacetDefinition

- (id)dateOfLastChange
{
  [(TDFacetDefinition *)self willAccessValueForKey:@"dateOfLastChange"];
  v3 = (void *)[(TDFacetDefinition *)self primitiveValueForKey:@"dateOfLastChange"];
  [(TDFacetDefinition *)self didAccessValueForKey:@"dateOfLastChange"];
  return v3;
}

- (void)setDateOfLastChange:(id)a3
{
  [(TDFacetDefinition *)self willChangeValueForKey:@"dateOfLastChange"];
  [(TDFacetDefinition *)self setPrimitiveValue:a3 forKey:@"dateOfLastChange"];

  [(TDFacetDefinition *)self didChangeValueForKey:@"dateOfLastChange"];
}

- (void)copyAttributesInto:(id)a3
{
  uint64_t v4 = [(TDFacetDefinition *)self valueForKey:@"facetName"];

  [a3 setValue:v4 forKey:@"facetName"];
}

- (id)keySpec
{
  [(TDFacetDefinition *)self willAccessValueForKey:@"keySpec"];
  v3 = (void *)[(TDFacetDefinition *)self primitiveValueForKey:@"keySpec"];
  [(TDFacetDefinition *)self didAccessValueForKey:@"keySpec"];
  return v3;
}

@end