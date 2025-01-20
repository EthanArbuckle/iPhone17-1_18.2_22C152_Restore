@interface VOTImageExplorerObjectClassificationElement
- (NSSet)matchingScenes;
- (VOTImageExplorerObjectClassificationElement)initWithImageView:(id)a3 forFeature:(id)a4 withMatchingScenes:(id)a5 hasFlippedYAxis:(BOOL)a6 objectIndex:(int64_t)a7;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)axObjectLabel;
- (int64_t)objectIndex;
- (void)setMatchingScenes:(id)a3;
- (void)setObjectIndex:(int64_t)a3;
@end

@implementation VOTImageExplorerObjectClassificationElement

- (VOTImageExplorerObjectClassificationElement)initWithImageView:(id)a3 forFeature:(id)a4 withMatchingScenes:(id)a5 hasFlippedYAxis:(BOOL)a6 objectIndex:(int64_t)a7
{
  BOOL v8 = a6;
  v12 = (NSSet *)a5;
  v16.receiver = self;
  v16.super_class = (Class)VOTImageExplorerObjectClassificationElement;
  v13 = [(VOTImageExplorerElement *)&v16 initWithImageView:a3 forFeature:a4 hasFlippedYAxis:v8];
  matchingScenes = v13->_matchingScenes;
  v13->_matchingScenes = v12;

  v13->_objectIndex = a7;
  return v13;
}

- (id)accessibilityLabel
{
  return [(VOTImageExplorerObjectClassificationElement *)self axObjectLabel];
}

- (id)accessibilityValue
{
  v3 = [(VOTImageExplorerElement *)self feature];
  v4 = [AXMVisionFeature localizedStringForLocation:[v3 locationUsingThirds:0 withFlippedYAxis:[self flippedYAxis]] isSubjectImplicit:1];

  return v4;
}

- (id)accessibilityIdentifier
{
  return @"VOTImageExplorerObjectClassificationElement";
}

- (id)axObjectLabel
{
  v3 = [(VOTImageExplorerElement *)self feature];
  v4 = [v3 classificationLabel];
  unsigned int v5 = [v4 isEqualToString:@"people"];

  if (v5)
  {
    v6 = sub_10000CFD0(@"VoiceOverImageExplorer.person.no.face.detected");
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, [(VOTImageExplorerObjectClassificationElement *)self objectIndex]);
  }
  else
  {
    BOOL v8 = [(VOTImageExplorerObjectClassificationElement *)self matchingScenes];
    id v9 = [v8 count];

    if (v9)
    {
      v10 = [(VOTImageExplorerObjectClassificationElement *)self matchingScenes];
      id v11 = [v10 count];

      if (v11 == (id)1)
      {
        v12 = [(VOTImageExplorerObjectClassificationElement *)self matchingScenes];
        v13 = [v12 allObjects];
        v14 = [v13 objectAtIndex:0];

        v15 = [v14 sceneClassId];
        id v16 = [v15 intValue];

        v17 = [(VOTImageExplorerElement *)self feature];
        v18 = [v17 sceneClassId];
        id v19 = [v18 intValue];

        if (+[AXMPhotoVisionSupport axmIsSceneClassId:v16 childOfSceneClassId:v19])
        {
          id v20 = [(VOTImageExplorerObjectClassificationElement *)self matchingScenes];
          v21 = [v20 allObjects];
          v22 = [v21 objectAtIndex:0];
          v7 = [v22 classificationLocalizedValue];
        }
        else
        {
          id v20 = [(VOTImageExplorerElement *)self feature];
          v7 = [v20 classificationLocalizedValue];
        }
      }
      else
      {
        v23 = [(VOTImageExplorerElement *)self feature];
        v14 = [v23 sceneClassId];

        v24 = +[NSMutableArray array];
        v25 = [(VOTImageExplorerObjectClassificationElement *)self matchingScenes];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10000CCF8;
        v28[3] = &unk_100024BC8;
        id v29 = v24;
        id v20 = v24;
        [v25 enumerateObjectsUsingBlock:v28];

        v26 = +[AXMPhotoVisionSupport findLeastCommonAncestorForSceneClassIds:withKnownAncestorSceneClassId:](AXMPhotoVisionSupport, "findLeastCommonAncestorForSceneClassIds:withKnownAncestorSceneClassId:", v20, [v14 intValue]);
        v7 = [v26 localizedName];
      }
    }
    else
    {
      v14 = [(VOTImageExplorerElement *)self feature];
      v7 = [v14 classificationLocalizedValue];
    }
  }

  return v7;
}

- (NSSet)matchingScenes
{
  return self->_matchingScenes;
}

- (void)setMatchingScenes:(id)a3
{
}

- (int64_t)objectIndex
{
  return self->_objectIndex;
}

- (void)setObjectIndex:(int64_t)a3
{
  self->_objectIndex = a3;
}

- (void).cxx_destruct
{
}

@end