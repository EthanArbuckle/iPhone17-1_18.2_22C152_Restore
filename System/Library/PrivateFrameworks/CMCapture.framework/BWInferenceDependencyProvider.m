@interface BWInferenceDependencyProvider
- (BWInferenceDependencyProvider)init;
- (NSArray)allInputVideoDependencies;
- (NSArray)allOutputVideoDependencies;
- (NSDictionary)providedVideoRequirementsByAttachedMediaKey;
- (NSMapTable)dependenciesByInputVideoRequirements;
- (NSMapTable)dependenciesByOutputVideoRequirements;
- (NSSet)consumedVideoAttachedMediaKeys;
- (id)dependenciesForInputVideoRequirement:(id)a3;
- (id)dependenciesForOutputVideoRequirement:(id)a3;
- (id)description;
- (int)supportedPixelBufferCompressionType;
- (void)dealloc;
- (void)setConsumedVideoAttachedMediaKeys:(id)a3;
- (void)setProvidedVideoRequirementsByAttachedMediaKey:(id)a3;
- (void)setSupportedPixelBufferCompressionType:(int)a3;
@end

@implementation BWInferenceDependencyProvider

- (NSMapTable)dependenciesByOutputVideoRequirements
{
  return self->_dependenciesByOutputVideoRequirements;
}

- (NSMapTable)dependenciesByInputVideoRequirements
{
  return self->_dependenciesByInputVideoRequirements;
}

- (NSDictionary)providedVideoRequirementsByAttachedMediaKey
{
  return self->_providedVideoRequirementsByAttachedMediaKey;
}

- (int)supportedPixelBufferCompressionType
{
  return self->_supportedPixelBufferCompressionType;
}

- (void)setSupportedPixelBufferCompressionType:(int)a3
{
  self->_supportedPixelBufferCompressionType = a3;
}

- (void)setProvidedVideoRequirementsByAttachedMediaKey:(id)a3
{
}

- (void)setConsumedVideoAttachedMediaKeys:(id)a3
{
}

- (id)dependenciesForInputVideoRequirement:(id)a3
{
  return [(NSMapTable *)self->_dependenciesByInputVideoRequirements objectForKey:a3];
}

- (id)dependenciesForOutputVideoRequirement:(id)a3
{
  return [(NSMapTable *)self->_dependenciesByOutputVideoRequirements objectForKey:a3];
}

- (NSArray)allOutputVideoDependencies
{
  v2 = [(NSMapTable *)self->_dependenciesByOutputVideoRequirements dictionaryRepresentation];
  return [(NSDictionary *)v2 allKeys];
}

- (NSArray)allInputVideoDependencies
{
  v2 = [(NSMapTable *)self->_dependenciesByInputVideoRequirements dictionaryRepresentation];
  return [(NSDictionary *)v2 allKeys];
}

- (NSSet)consumedVideoAttachedMediaKeys
{
  return self->_consumedVideoAttachedMediaKeys;
}

- (BWInferenceDependencyProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceDependencyProvider;
  v2 = [(BWInferenceDependencyProvider *)&v7 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    [v3 setHashFunction:satisfiedVideoRequirementHash];
    [v3 setIsEqualFunction:satisfiedVideoRequirementCheck];
    uint64_t v4 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    v2->_dependenciesByInputVideoRequirements = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v3 valuePointerFunctions:v4 capacity:0];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v3 valuePointerFunctions:v4 capacity:0];
    v2->_providedVideoRequirementsByAttachedMediaKey = 0;
    v2->_consumedVideoAttachedMediaKeys = 0;
    v2->_dependenciesByOutputVideoRequirements = (NSMapTable *)v5;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceDependencyProvider;
  [(BWInferenceDependencyProvider *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> %lu inputVideoDependencies %lu outputVideoDependencies consumedKeys:%@ providedKeys:%@", objc_opt_class(), self, -[NSMapTable count](self->_dependenciesByInputVideoRequirements, "count"), -[NSMapTable count](self->_dependenciesByOutputVideoRequirements, "count"), self->_consumedVideoAttachedMediaKeys, -[NSDictionary allKeys](self->_providedVideoRequirementsByAttachedMediaKey, "allKeys")];
}

@end