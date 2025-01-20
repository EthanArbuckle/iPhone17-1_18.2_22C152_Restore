@interface MURelatedPlaceSectionControllerConfiguration
- (BOOL)suppressItemSelection;
- (BOOL)suppressSeeAllButton;
- (GEORelatedPlaceList)relatedPlaceList;
- (GEORelatedPlaceModuleConfiguration)moduleConfiguration;
- (GEOTrailHead)trailHead;
- (MURelatedPlaceSectionControllerConfiguration)initWithDataSource:(int64_t)a3 relatedPlaceList:(id)a4 trailHead:(id)a5;
- (MURelatedPlaceSectionControllerConfiguration)initWithRelatedPlaceList:(id)a3;
- (MURelatedPlaceSectionControllerConfiguration)initWithTrailHead:(id)a3;
- (int64_t)dataSource;
- (unint64_t)numInlineItems;
- (void)setModuleConfiguration:(id)a3;
- (void)setSuppressItemSelection:(BOOL)a3;
- (void)setSuppressSeeAllButton:(BOOL)a3;
@end

@implementation MURelatedPlaceSectionControllerConfiguration

- (MURelatedPlaceSectionControllerConfiguration)initWithDataSource:(int64_t)a3 relatedPlaceList:(id)a4 trailHead:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MURelatedPlaceSectionControllerConfiguration;
  v11 = [(MURelatedPlaceSectionControllerConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_dataSource = a3;
    objc_storeStrong((id *)&v11->_relatedPlaceList, a4);
    objc_storeStrong((id *)&v12->_trailHead, a5);
  }

  return v12;
}

- (MURelatedPlaceSectionControllerConfiguration)initWithRelatedPlaceList:(id)a3
{
  return [(MURelatedPlaceSectionControllerConfiguration *)self initWithDataSource:0 relatedPlaceList:a3 trailHead:0];
}

- (MURelatedPlaceSectionControllerConfiguration)initWithTrailHead:(id)a3
{
  return [(MURelatedPlaceSectionControllerConfiguration *)self initWithDataSource:1 relatedPlaceList:0 trailHead:a3];
}

- (GEORelatedPlaceModuleConfiguration)moduleConfiguration
{
  return self->_moduleConfiguration;
}

- (void)setModuleConfiguration:(id)a3
{
}

- (GEORelatedPlaceList)relatedPlaceList
{
  return self->_relatedPlaceList;
}

- (int64_t)dataSource
{
  return self->_dataSource;
}

- (GEOTrailHead)trailHead
{
  return self->_trailHead;
}

- (BOOL)suppressSeeAllButton
{
  return self->_suppressSeeAllButton;
}

- (void)setSuppressSeeAllButton:(BOOL)a3
{
  self->_suppressSeeAllButton = a3;
}

- (unint64_t)numInlineItems
{
  return self->_numInlineItems;
}

- (BOOL)suppressItemSelection
{
  return self->_suppressItemSelection;
}

- (void)setSuppressItemSelection:(BOOL)a3
{
  self->_suppressItemSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailHead, 0);
  objc_storeStrong((id *)&self->_relatedPlaceList, 0);
  objc_storeStrong((id *)&self->_moduleConfiguration, 0);
}

@end