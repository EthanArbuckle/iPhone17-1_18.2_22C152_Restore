@interface VCPProgressStatistics
- (VCPProgressStatistics)init;
- (unint64_t)analyzedWithResourcesCounter:(unint64_t)a3;
- (unint64_t)analyzedWithoutResourcesCounter:(unint64_t)a3;
- (unint64_t)numAssetsUnanalyzedWithResources;
- (unint64_t)numAssetsUnanalyzedWithoutResources;
- (unint64_t)numExistingAssetsNotUpdatedWithResources;
- (unint64_t)numExistingAssetsNotUpdatedWithoutResources;
- (unint64_t)numExistingAssetsUnanalyzedWithResources;
- (unint64_t)numExistingAssetsUnanalyzedWithoutResources;
- (unint64_t)numNewAssetsUnanalyzedWithResources;
- (unint64_t)numNewAssetsUnanalyzedWithoutResources;
- (unint64_t)unanalyzedWithResourcesCounter:(unint64_t)a3;
- (unint64_t)unanalyzedWithoutResourcesCounter:(unint64_t)a3;
- (void)addAnalyzedWithResourcesCounter:(unint64_t)a3;
- (void)addAnalyzedWithoutResourcesCounter:(unint64_t)a3;
- (void)addUnanalyzedWithResourcesCounter:(unint64_t)a3;
- (void)addUnanalyzedWithoutResourcesCounter:(unint64_t)a3;
- (void)setNumAssetsUnanalyzedWithResources:(unint64_t)a3;
- (void)setNumAssetsUnanalyzedWithoutResources:(unint64_t)a3;
- (void)setNumExistingAssetsNotUpdatedWithResources:(unint64_t)a3;
- (void)setNumExistingAssetsNotUpdatedWithoutResources:(unint64_t)a3;
- (void)setNumExistingAssetsUnanalyzedWithResources:(unint64_t)a3;
- (void)setNumExistingAssetsUnanalyzedWithoutResources:(unint64_t)a3;
- (void)setNumNewAssetsUnanalyzedWithResources:(unint64_t)a3;
- (void)setNumNewAssetsUnanalyzedWithoutResources:(unint64_t)a3;
@end

@implementation VCPProgressStatistics

- (VCPProgressStatistics)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPProgressStatistics;
  v2 = [(VCPProgressStatistics *)&v6 init];
  v3 = (VCPProgressStatistics *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 248) = 0u;
    *(_OWORD *)(v2 + 232) = 0u;
    *(_OWORD *)(v2 + 216) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 328) = 0u;
    *(_OWORD *)(v2 + 344) = 0u;
    *(_OWORD *)(v2 + 296) = 0u;
    *(_OWORD *)(v2 + 312) = 0u;
    *(_OWORD *)(v2 + 264) = 0u;
    *(_OWORD *)(v2 + 280) = 0u;
    v4 = v2;
  }

  return v3;
}

- (void)addUnanalyzedWithResourcesCounter:(unint64_t)a3
{
}

- (unint64_t)unanalyzedWithResourcesCounter:(unint64_t)a3
{
  return self->_unanalyzedWithResourcesCounter[a3];
}

- (void)addUnanalyzedWithoutResourcesCounter:(unint64_t)a3
{
}

- (unint64_t)unanalyzedWithoutResourcesCounter:(unint64_t)a3
{
  return self->_unanalyzedWithoutResourcesCounter[a3];
}

- (void)addAnalyzedWithResourcesCounter:(unint64_t)a3
{
}

- (unint64_t)analyzedWithResourcesCounter:(unint64_t)a3
{
  return self->_analyzedWithResourcesCounter[a3];
}

- (void)addAnalyzedWithoutResourcesCounter:(unint64_t)a3
{
}

- (unint64_t)analyzedWithoutResourcesCounter:(unint64_t)a3
{
  return self->_analyzedWithoutResourcesCounter[a3];
}

- (unint64_t)numAssetsUnanalyzedWithResources
{
  return self->_numAssetsUnanalyzedWithResources;
}

- (void)setNumAssetsUnanalyzedWithResources:(unint64_t)a3
{
  self->_numAssetsUnanalyzedWithResources = a3;
}

- (unint64_t)numAssetsUnanalyzedWithoutResources
{
  return self->_numAssetsUnanalyzedWithoutResources;
}

- (void)setNumAssetsUnanalyzedWithoutResources:(unint64_t)a3
{
  self->_numAssetsUnanalyzedWithoutResources = a3;
}

- (unint64_t)numNewAssetsUnanalyzedWithResources
{
  return self->_numNewAssetsUnanalyzedWithResources;
}

- (void)setNumNewAssetsUnanalyzedWithResources:(unint64_t)a3
{
  self->_numNewAssetsUnanalyzedWithResources = a3;
}

- (unint64_t)numNewAssetsUnanalyzedWithoutResources
{
  return self->_numNewAssetsUnanalyzedWithoutResources;
}

- (void)setNumNewAssetsUnanalyzedWithoutResources:(unint64_t)a3
{
  self->_numNewAssetsUnanalyzedWithoutResources = a3;
}

- (unint64_t)numExistingAssetsUnanalyzedWithResources
{
  return self->_numExistingAssetsUnanalyzedWithResources;
}

- (void)setNumExistingAssetsUnanalyzedWithResources:(unint64_t)a3
{
  self->_numExistingAssetsUnanalyzedWithResources = a3;
}

- (unint64_t)numExistingAssetsUnanalyzedWithoutResources
{
  return self->_numExistingAssetsUnanalyzedWithoutResources;
}

- (void)setNumExistingAssetsUnanalyzedWithoutResources:(unint64_t)a3
{
  self->_numExistingAssetsUnanalyzedWithoutResources = a3;
}

- (unint64_t)numExistingAssetsNotUpdatedWithResources
{
  return self->_numExistingAssetsNotUpdatedWithResources;
}

- (void)setNumExistingAssetsNotUpdatedWithResources:(unint64_t)a3
{
  self->_numExistingAssetsNotUpdatedWithResources = a3;
}

- (unint64_t)numExistingAssetsNotUpdatedWithoutResources
{
  return self->_numExistingAssetsNotUpdatedWithoutResources;
}

- (void)setNumExistingAssetsNotUpdatedWithoutResources:(unint64_t)a3
{
  self->_numExistingAssetsNotUpdatedWithoutResources = a3;
}

@end