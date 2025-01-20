@interface VOTImageExplorerImageView
- (BOOL)_accessibilityShouldIncludeRegionDescription;
- (BOOL)_accessibilityShouldIncludeRemoteParentCustomActions;
- (BOOL)addElement:(id)a3 toElements:(id)a4 forFeatureKey:(id)a5;
- (BOOL)isAccessibilityElement;
- (NSArray)axSortedElements;
- (NSArray)filteredColumnFeatures;
- (NSArray)filteredRowFeatures;
- (NSArray)visionFeatures;
- (NSDictionary)elements;
- (NSMutableArray)faceFeatures;
- (NSMutableArray)objectClassificationFeatures;
- (NSMutableArray)ocrFeatures;
- (NSMutableArray)peopleFeatures;
- (NSMutableArray)sceneClassificationFeatures;
- (NSMutableDictionary)imageExplorerRotorCache;
- (id)_accessibilityCustomContentForFeature:(id)a3;
- (id)_axNearbyRelationKeyForFeature:(id)a3 andNeighborFeature:(id)a4;
- (id)_axNearbyRelationsForFeature:(id)a3;
- (id)_axRelationOfCurrentFrame:(CGRect)a3 withNeighborFrame:(CGRect)a4;
- (id)_findPeopleFeatureThatOverlapsWithFace:(id)a3;
- (id)_generateFaceAccessibilityElements;
- (id)_generateOCRDocumentAccessibilityElements;
- (id)_generateOCRTextAccessibilityElementsForFeature:(id)a3;
- (id)_generateObjectClassificationAccessibilityElements;
- (id)accessibilityCustomRotors;
- (id)explorableOCRTypes;
- (id)filteredSubfeaturesForFeature:(id)a3 withOCRType:(int64_t)a4;
- (id)generateAccessibilityElements;
- (id)imageExplorerRotorWithName:(id)a3;
- (id)sortedElements;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)setAxSortedElements:(id)a3;
- (void)setElements:(id)a3;
- (void)setFaceFeatures:(id)a3;
- (void)setFilteredColumnFeatures:(id)a3;
- (void)setFilteredRowFeatures:(id)a3;
- (void)setImageExplorerRotorCache:(id)a3;
- (void)setObjectClassificationFeatures:(id)a3;
- (void)setOcrFeatures:(id)a3;
- (void)setPeopleFeatures:(id)a3;
- (void)setSceneClassificationFeatures:(id)a3;
- (void)setVisionFeatures:(id)a3;
@end

@implementation VOTImageExplorerImageView

- (void)setVisionFeatures:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  [(VOTImageExplorerImageView *)self setObjectClassificationFeatures:v5];

  v6 = +[NSMutableArray array];
  [(VOTImageExplorerImageView *)self setSceneClassificationFeatures:v6];

  v7 = +[NSMutableArray array];
  [(VOTImageExplorerImageView *)self setOcrFeatures:v7];

  v8 = +[NSMutableArray array];
  [(VOTImageExplorerImageView *)self setFaceFeatures:v8];

  v9 = +[NSMutableArray array];
  [(VOTImageExplorerImageView *)self setPeopleFeatures:v9];

  v10 = +[NSArray axArrayByIgnoringNilElementsWithCount:1, @"people"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v17 = (uint64_t)[v16 featureType];
        if (v17 <= 25)
        {
          switch(v17)
          {
            case 5:
            case 6:
              goto LABEL_8;
            case 8:
              v19 = [(VOTImageExplorerImageView *)self explorableOCRTypes];
              v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 ocrFeatureType]);
              unsigned int v21 = [v19 containsObject:v20];

              if (!v21) {
                continue;
              }
              v18 = [(VOTImageExplorerImageView *)self ocrFeatures];
              break;
            case 9:
              goto LABEL_17;
            case 10:
              goto LABEL_19;
            default:
              continue;
          }
          goto LABEL_23;
        }
        if (v17 == 26)
        {
          if (!AXRuntimeCheck_MediaAnalysisSupport()) {
            continue;
          }
LABEL_17:
          v18 = [(VOTImageExplorerImageView *)self sceneClassificationFeatures];
          goto LABEL_23;
        }
        if (v17 == 27)
        {
          if (!AXRuntimeCheck_MediaAnalysisSupport()) {
            continue;
          }
LABEL_19:
          v22 = [v16 classificationLabel];
          unsigned __int8 v23 = [v10 containsObject:v22];

          if (v23)
          {
            v24 = [v16 classificationLabel];
            unsigned int v25 = [v24 isEqualToString:@"people"];

            if (!v25) {
              continue;
            }
            v18 = [(VOTImageExplorerImageView *)self peopleFeatures];
          }
          else
          {
            v18 = [(VOTImageExplorerImageView *)self objectClassificationFeatures];
          }
          goto LABEL_23;
        }
        if (v17 == 31 && AXRuntimeCheck_MediaAnalysisSupport())
        {
LABEL_8:
          v18 = [(VOTImageExplorerImageView *)self faceFeatures];
LABEL_23:
          v26 = v18;
          [v18 axSafelyAddObject:v16];

          continue;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v13);
  }

  v27 = [(VOTImageExplorerImageView *)self faceFeatures];
  if ([v27 count]) {
    goto LABEL_29;
  }
  v28 = [(VOTImageExplorerImageView *)self peopleFeatures];
  id v29 = [v28 count];

  if (v29)
  {
    v27 = [(VOTImageExplorerImageView *)self objectClassificationFeatures];
    v30 = [(VOTImageExplorerImageView *)self peopleFeatures];
    [v27 axSafelyAddObjectsFromArray:v30];

LABEL_29:
  }
}

- (NSDictionary)elements
{
  if (!self->_elements)
  {
    v3 = [(VOTImageExplorerImageView *)self ocrFeatures];
    if ([v3 count])
    {
LABEL_5:

LABEL_6:
      v5 = [(VOTImageExplorerImageView *)self generateAccessibilityElements];
      elements = self->_elements;
      self->_elements = v5;

      goto LABEL_7;
    }
    id v4 = [(VOTImageExplorerImageView *)self objectClassificationFeatures];
    if ([v4 count])
    {

      goto LABEL_5;
    }
    v9 = [(VOTImageExplorerImageView *)self faceFeatures];
    id v10 = [v9 count];

    if (v10) {
      goto LABEL_6;
    }
  }
LABEL_7:
  v7 = self->_elements;

  return v7;
}

- (NSArray)axSortedElements
{
  if (!self->_axSortedElements)
  {
    v3 = [(VOTImageExplorerImageView *)self elements];

    if (v3)
    {
      id v4 = [(VOTImageExplorerImageView *)self sortedElements];
      axSortedElements = self->_axSortedElements;
      self->_axSortedElements = v4;
    }
  }
  v6 = self->_axSortedElements;

  return v6;
}

- (id)filteredSubfeaturesForFeature:(id)a3 withOCRType:(int64_t)a4
{
  v5 = [a3 subfeatures];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000929C;
  v9[3] = &unk_100024968;
  v9[4] = a4;
  v6 = +[NSPredicate predicateWithBlock:v9];
  v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(VOTImageExplorerImageView *)self axSortedElements];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)accessibilityCustomRotors
{
  BOOL v3 = +[NSMutableArray array];
  v33.receiver = self;
  v33.super_class = (Class)VOTImageExplorerImageView;
  id v4 = [(VOTImageExplorerImageView *)&v33 accessibilityCustomRotors];
  id v28 = v3;
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(VOTImageExplorerImageView *)self ocrFeatures];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableSet);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v8 = [(VOTImageExplorerImageView *)self ocrFeatures];
    id v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v9) {
      goto LABEL_22;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 ocrFeatureType]);
        unsigned __int8 v15 = [v7 containsObject:v14];

        if ((v15 & 1) == 0)
        {
          v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 ocrFeatureType]);
          [v7 addObject:v16];

          uint64_t v17 = (uint64_t)[v13 ocrFeatureType];
          if (v17 <= 12)
          {
            if (v17 == 1)
            {
              CFStringRef v18 = @"VoiceOverImageExplorer.text.rotor";
            }
            else
            {
              if (v17 != 7) {
                continue;
              }
              CFStringRef v18 = @"VoiceOverImageExplorer.table.rotor";
            }
            goto LABEL_19;
          }
          if (v17 == 16 || v17 == 13)
          {
            CFStringRef v18 = @"VoiceOverImageExplorer.document.rotor";
LABEL_19:
            v20 = [(VOTImageExplorerImageView *)self imageExplorerRotorWithName:v18];
            [v28 axSafelyAddObject:v20];

            continue;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v10)
      {
LABEL_22:

        break;
      }
    }
  }
  unsigned int v21 = [(VOTImageExplorerImageView *)self objectClassificationFeatures];
  id v22 = [v21 count];

  if (v22)
  {
    unsigned __int8 v23 = [(VOTImageExplorerImageView *)self imageExplorerRotorWithName:@"VoiceOverImageExplorer.objects.rotor"];
    [v28 axSafelyAddObject:v23];
  }
  v24 = [(VOTImageExplorerImageView *)self faceFeatures];
  id v25 = [v24 count];

  if (v25)
  {
    v26 = [(VOTImageExplorerImageView *)self imageExplorerRotorWithName:@"VoiceOverImageExplorer.people.rotor"];
    [v28 axSafelyAddObject:v26];
  }

  return v28;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeRemoteParentCustomActions
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeRegionDescription
{
  return 0;
}

- (id)explorableOCRTypes
{
  return &off_100026030;
}

- (id)generateAccessibilityElements
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  id v4 = [(VOTImageExplorerImageView *)self ocrFeatures];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(VOTImageExplorerImageView *)self _generateOCRDocumentAccessibilityElements];
    [v3 axSafelyAddEntriesFromDictionary:v6];
  }
  id v7 = [(VOTImageExplorerImageView *)self faceFeatures];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = [(VOTImageExplorerImageView *)self _generateFaceAccessibilityElements];
    [v3 axSafelyAddEntriesFromDictionary:v9];
  }
  id v10 = [(VOTImageExplorerImageView *)self objectClassificationFeatures];
  id v11 = [v10 count];

  if (v11)
  {
    id v12 = [(VOTImageExplorerImageView *)self _generateObjectClassificationAccessibilityElements];
    [v3 axSafelyAddEntriesFromDictionary:v12];
  }

  return v3;
}

- (id)_generateOCRDocumentAccessibilityElements
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(VOTImageExplorerImageView *)self ocrFeatures];
  id v4 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v47;
    *(void *)&long long v5 = 138412546;
    long long v36 = v5;
    uint64_t v37 = *(void *)v47;
    v38 = v3;
    do
    {
      id v8 = 0;
      id v39 = v6;
      do
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v8);
        if (objc_msgSend(v9, "ocrFeatureType", v36) == (id)1)
        {
          id v10 = [(VOTImageExplorerImageView *)self _generateOCRTextAccessibilityElementsForFeature:v9];
          [v3 axSafelyAddEntriesFromDictionary:v10];
        }
        else
        {
          v43 = v8;
          if ([v9 ocrFeatureType] == (id)7)
          {
            id v11 = [(VOTImageExplorerElement *)[VOTImageExplorerTableElement alloc] initWithImageView:self forFeature:v9 hasFlippedYAxis:0];
            id v12 = [(VOTImageExplorerImageView *)self _accessibilityCustomContentForFeature:v9];
            v42 = v11;
            [(VOTImageExplorerTableElement *)v11 setAccessibilityCustomContent:v12];
            CFStringRef v13 = @"VoiceOverImageExplorer.table.rotor";
          }
          else
          {
            uint64_t v14 = [(VOTImageExplorerElement *)[VOTImageExplorerDocumentElement alloc] initWithImageView:self forFeature:v9 hasFlippedYAxis:0];
            id v12 = [(VOTImageExplorerImageView *)self _accessibilityCustomContentForFeature:v9];
            v42 = (VOTImageExplorerTableElement *)v14;
            [(VOTImageExplorerDocumentElement *)v14 setAccessibilityCustomContent:v12];
            CFStringRef v13 = @"VoiceOverImageExplorer.document.rotor";
          }
          CFStringRef v41 = v13;

          unsigned __int8 v15 = +[NSMutableArray array];
          v16 = [(VOTImageExplorerImageView *)self filteredSubfeaturesForFeature:v9 withOCRType:9];
          id v17 = [v16 count];

          if (v17)
          {
            unint64_t v18 = 0;
            do
            {
              v19 = [(VOTImageExplorerImageView *)self filteredSubfeaturesForFeature:v9 withOCRType:9];
              v20 = [v19 objectAtIndex:v18];

              unsigned int v21 = [v20 subfeatures];
              id v22 = [v21 count];

              if (v22)
              {
                unint64_t v23 = 0;
                do
                {
                  v24 = [v20 subfeatures];
                  id v25 = [v24 objectAtIndex:v23];

                  v26 = [[VOTImageExplorerTextElement alloc] initWithImageView:self forTextFeature:v25 withParentTextFeature:v9 hasFlippedYAxis:0];
                  v27 = [(VOTImageExplorerImageView *)self _accessibilityCustomContentForFeature:v9];
                  [(VOTImageExplorerTextElement *)v26 setAccessibilityCustomContent:v27];

                  [(VOTImageExplorerTextElement *)v26 setRowIndex:v18];
                  [(VOTImageExplorerTextElement *)v26 setColumnIndex:v23];
                  [v15 axSafelyAddObject:v26];

                  ++v23;
                  id v28 = [v20 subfeatures];
                  id v29 = [v28 count];
                }
                while (v23 < (unint64_t)v29);
              }

              ++v18;
              long long v30 = [(VOTImageExplorerImageView *)self filteredSubfeaturesForFeature:v9 withOCRType:9];
              id v31 = [v30 count];
            }
            while (v18 < (unint64_t)v31);
          }
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100009C14;
          v44[3] = &unk_1000249D0;
          id v32 = v15;
          id v45 = v32;
          id v10 = v42;
          [(VOTImageExplorerTableElement *)v42 _setAccessibilityElementsBlock:v44];
          BOOL v3 = v38;
          id v8 = v43;
          if (![(VOTImageExplorerImageView *)self addElement:v42 toElements:v38 forFeatureKey:v41])
          {
            objc_super v33 = VOTLogImageExplorer();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              long long v34 = [(VOTImageExplorerDocumentElement *)v42 description];
              *(_DWORD *)buf = v36;
              v51 = v34;
              __int16 v52 = 2112;
              CFStringRef v53 = v41;
              _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Unable to add element %@ with a feature key of: %@", buf, 0x16u);
            }
          }

          uint64_t v7 = v37;
          id v6 = v39;
        }

        id v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_generateOCRTextAccessibilityElementsForFeature:(id)a3
{
  id v4 = a3;
  long long v5 = +[NSMutableDictionary dictionary];
  id v6 = [(VOTImageExplorerElement *)[VOTImageExplorerDocumentElement alloc] initWithImageView:self forFeature:v4 hasFlippedYAxis:0];
  uint64_t v7 = +[NSMutableArray array];
  id v8 = [v4 value];
  id v9 = [v8 length];

  if (v9)
  {
    unsigned int v21 = v5;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v4 subfeatures];
    id v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v32;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v12 = [v11 subfeatures];
          id v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = [[VOTImageExplorerTextElement alloc] initWithImageView:self forTextFeature:*(void *)(*((void *)&v27 + 1) + 8 * (void)j) withParentTextFeature:v4 hasFlippedYAxis:0];
                [v7 axSafelyAddObject:v17];
              }
              id v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v14);
          }
        }
        id v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v24);
    }

    long long v5 = v21;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100009F30;
  v25[3] = &unk_1000249D0;
  id v18 = v7;
  id v26 = v18;
  [(VOTImageExplorerDocumentElement *)v6 _setAccessibilityElementsBlock:v25];
  if (![(VOTImageExplorerImageView *)self addElement:v6 toElements:v5 forFeatureKey:@"VoiceOverImageExplorer.text.rotor"])
  {
    v19 = VOTLogImageExplorer();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_100013F64(v6, v19);
    }
  }

  return v5;
}

- (id)_generateObjectClassificationAccessibilityElements
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(VOTImageExplorerImageView *)self objectClassificationFeatures];
  id v4 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v5 = 138412546;
    long long v20 = v5;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v9);
        id v11 = [(VOTImageExplorerImageView *)self sceneClassificationFeatures];
        id v12 = +[AXMVisionFeature filterFeatureList:v11 basedOnSceneClassIdsForFeature:v10];

        id v13 = [v10 classificationLabel];
        unsigned int v14 = [v13 isEqualToString:@"people"];

        v7 += v14;
        uint64_t v15 = [[VOTImageExplorerObjectClassificationElement alloc] initWithImageView:self forFeature:v10 withMatchingScenes:v12 hasFlippedYAxis:1 objectIndex:v7];
        v16 = [(VOTImageExplorerImageView *)self _accessibilityCustomContentForFeature:v10];
        [(VOTImageExplorerObjectClassificationElement *)v15 setAccessibilityCustomContent:v16];

        if (![(VOTImageExplorerImageView *)self addElement:v15 toElements:v3 forFeatureKey:@"VoiceOverImageExplorer.objects.rotor"])
        {
          id v17 = VOTLogImageExplorer();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            id v18 = [(VOTImageExplorerObjectClassificationElement *)v15 description];
            *(_DWORD *)buf = v20;
            long long v27 = v18;
            __int16 v28 = 2112;
            CFStringRef v29 = @"VoiceOverImageExplorer.objects.rotor";
            _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Unable to add element %@ with a feature key of: %@", buf, 0x16u);
          }
        }

        id v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_generateFaceAccessibilityElements
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableSet set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(VOTImageExplorerImageView *)self faceFeatures];
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v30;
    *(void *)&long long v6 = 138412546;
    long long v24 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v11 = -[VOTImageExplorerImageView _findPeopleFeatureThatOverlapsWithFace:](self, "_findPeopleFeatureThatOverlapsWithFace:", v10, v24);
        [v4 axSafelyAddObject:v11];
        id v12 = [[VOTImageExplorerFaceElement alloc] initWithImageView:self forFaceFeature:v10 withOverlappingPeopleFeature:v11 hasFlippedYAxis:0];
        id v13 = [(VOTImageExplorerImageView *)self _accessibilityCustomContentForFeature:v10];
        [(VOTImageExplorerFaceElement *)v12 setAccessibilityCustomContent:v13];

        if (![(VOTImageExplorerImageView *)self addElement:v12 toElements:v3 forFeatureKey:@"VoiceOverImageExplorer.people.rotor"])
        {
          unsigned int v14 = VOTLogImageExplorer();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            long long v25 = [(VOTImageExplorerFaceElement *)v12 description];
            *(_DWORD *)buf = v24;
            long long v34 = v25;
            __int16 v35 = 2112;
            CFStringRef v36 = @"VoiceOverImageExplorer.people.rotor";
            _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Unable to add element %@ with a feature key of: %@", buf, 0x16u);
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v7);
  }

  uint64_t v15 = [(VOTImageExplorerImageView *)self faceFeatures];
  id v16 = [v15 count];
  id v17 = [(VOTImageExplorerImageView *)self peopleFeatures];
  id v18 = [v17 count];

  if (v16 < v18)
  {
    v19 = [(VOTImageExplorerImageView *)self peopleFeatures];

    if (v19 && v4)
    {
      long long v20 = [(VOTImageExplorerImageView *)self peopleFeatures];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10000A518;
      v27[3] = &unk_1000249F8;
      id v28 = v4;
      [v20 ax_removeObjectsFromArrayUsingBlock:v27];
    }
    unsigned int v21 = [(VOTImageExplorerImageView *)self objectClassificationFeatures];
    long long v22 = [(VOTImageExplorerImageView *)self peopleFeatures];
    [v21 axSafelyAddObjectsFromArray:v22];
  }

  return v3;
}

- (id)_findPeopleFeatureThatOverlapsWithFace:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10000A6A8;
  id v18 = sub_10000A6B8;
  id v19 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0x10000000000000;
  id v5 = [(VOTImageExplorerImageView *)self peopleFeatures];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A6C0;
  v9[3] = &unk_100024A20;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = v13;
  id v12 = &v14;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v15[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (BOOL)addElement:(id)a3 toElements:(id)a4 forFeatureKey:(id)a5
{
  id v7 = a3;
  if (a5)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = [v9 objectForKeyedSubscript:v8];
    if (!v10)
    {
      id v10 = +[NSMutableArray array];
    }
    [v10 addObject:v7];
    [v9 setObject:v10 forKey:v8];
  }
  return a5 != 0;
}

- (id)imageExplorerRotorWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTImageExplorerImageView *)self elements];

  if (v5)
  {
    id v6 = [(VOTImageExplorerImageView *)self imageExplorerRotorCache];
    id v7 = [v6 objectForKey:v4];
    if (!v7)
    {
      objc_initWeak(&location, self);
      id v8 = objc_alloc((Class)UIAccessibilityCustomRotor);
      id v9 = sub_10000CFD0(v4);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000AAF8;
      v12[3] = &unk_100024A88;
      objc_copyWeak(&v14, &location);
      id v10 = v4;
      id v13 = v10;
      id v7 = [v8 initWithName:v9 itemSearchBlock:v12];

      [v6 setObject:v7 forKey:v10];
      [(VOTImageExplorerImageView *)self setImageExplorerRotorCache:v6];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)sortedElements
{
  v2 = [(VOTImageExplorerImageView *)self elements];
  BOOL v3 = [v2 allValues];
  id v4 = [v3 valueForKeyPath:@"@unionOfArrays.self"];

  id v5 = [v4 sortedArrayUsingSelector:"accessibilityCompareGeometry:"];

  return v5;
}

- (id)_axRelationOfCurrentFrame:(CGRect)a3 withNeighborFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double MinX = CGRectGetMinX(a4);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v26);
  v27.origin.CGFloat x = v11;
  v27.origin.CGFloat y = v10;
  v27.size.CGFloat width = v9;
  v27.size.CGFloat height = v8;
  double MidX = CGRectGetMidX(v27);
  v28.origin.CGFloat x = v11;
  v28.origin.CGFloat y = v10;
  v28.size.CGFloat width = v9;
  v28.size.CGFloat height = v8;
  double MidY = CGRectGetMidY(v28);
  if (MidX >= MinX)
  {
    if (MidX >= MaxX)
    {
      CFStringRef v18 = @"VoiceOverImageExplorer.relations.top-left";
      if (MidY < MaxY) {
        CFStringRef v18 = @"VoiceOverImageExplorer.relations.left";
      }
      if (MidY > MinY) {
        uint64_t v16 = (__CFString *)v18;
      }
      else {
        uint64_t v16 = @"VoiceOverImageExplorer.relations.bottom-left";
      }
    }
    else if (MidY <= MinY)
    {
      uint64_t v16 = @"VoiceOverImageExplorer.relations.bottom";
    }
    else
    {
      if (MidY < MaxY)
      {
        id v17 = 0;
        goto LABEL_19;
      }
      uint64_t v16 = @"VoiceOverImageExplorer.relations.top";
    }
  }
  else
  {
    CFStringRef v15 = @"VoiceOverImageExplorer.relations.top-right";
    if (MidY < MaxY) {
      CFStringRef v15 = @"VoiceOverImageExplorer.relations.right";
    }
    if (MidY >= MinY) {
      uint64_t v16 = (__CFString *)v15;
    }
    else {
      uint64_t v16 = @"VoiceOverImageExplorer.relations.bottom-right";
    }
  }
  id v17 = sub_10000CFD0(v16);
LABEL_19:

  return v17;
}

- (id)_axNearbyRelationKeyForFeature:(id)a3 andNeighborFeature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 featureType];
  [v6 featureType];
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    [v7 featureType];
    [v6 featureType];
  }
  if (v6 == v7)
  {
    CGRect v24 = 0;
  }
  else
  {
    [v6 normalizedFrame];
    [(VOTImageExplorerImageView *)self frame];
    UIAccessibilityFrameForBounds();
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [v7 normalizedFrame];
    [(VOTImageExplorerImageView *)self frame];
    UIAccessibilityFrameForBounds();
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGRect v24 = -[VOTImageExplorerImageView _axRelationOfCurrentFrame:withNeighborFrame:](self, "_axRelationOfCurrentFrame:withNeighborFrame:", v9, v11, v13, v15, v16, v18, v20, v22);
    v29.origin.CGFloat x = v9;
    v29.origin.CGFloat y = v11;
    v29.size.CGFloat width = v13;
    v29.size.CGFloat height = v15;
    v32.origin.CGFloat x = v17;
    v32.origin.CGFloat y = v19;
    v32.size.CGFloat width = v21;
    v32.size.CGFloat height = v23;
    if (CGRectIntersectsRect(v29, v32))
    {
      v30.origin.CGFloat x = v9;
      v30.origin.CGFloat y = v11;
      v30.size.CGFloat width = v13;
      v30.size.CGFloat height = v15;
      v33.origin.CGFloat x = v17;
      v33.origin.CGFloat y = v19;
      v33.size.CGFloat width = v21;
      v33.size.CGFloat height = v23;
      if (CGRectContainsRect(v30, v33)) {
        goto LABEL_7;
      }
      v31.origin.CGFloat x = v17;
      v31.origin.CGFloat y = v19;
      v31.size.CGFloat width = v21;
      v31.size.CGFloat height = v23;
      v34.origin.CGFloat x = v9;
      v34.origin.CGFloat y = v11;
      v34.size.CGFloat width = v13;
      v34.size.CGFloat height = v15;
      if (CGRectContainsRect(v31, v34))
      {
LABEL_7:
        CGRect v25 = sub_10000CFD0(@"VoiceOverImageExplorer.relations.overlaps");
        uint64_t v26 = __UIAXStringForVariables();

        CGRect v24 = (void *)v26;
      }
    }
  }

  return v24;
}

- (id)_axNearbyRelationsForFeature:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  objc_initWeak(&location, self);
  id v6 = [(VOTImageExplorerImageView *)self faceFeatures];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000B49C;
  v26[3] = &unk_100024AB0;
  objc_copyWeak(&v29, &location);
  id v7 = v4;
  id v27 = v7;
  id v8 = v5;
  id v28 = v8;
  [v6 enumerateObjectsUsingBlock:v26];

  double v9 = [(VOTImageExplorerImageView *)self objectClassificationFeatures];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000B610;
  v22[3] = &unk_100024AB0;
  objc_copyWeak(&v25, &location);
  id v10 = v7;
  id v23 = v10;
  id v11 = v8;
  id v24 = v11;
  [v9 enumerateObjectsUsingBlock:v22];

  double v12 = [(VOTImageExplorerImageView *)self ocrFeatures];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000B734;
  v18[3] = &unk_100024AB0;
  objc_copyWeak(&v21, &location);
  id v13 = v10;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  [v12 enumerateObjectsUsingBlock:v18];

  double v15 = v20;
  id v16 = v14;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v16;
}

- (id)_accessibilityCustomContentForFeature:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  double v12 = sub_10000A6A8;
  id v13 = sub_10000A6B8;
  id v14 = +[NSMutableArray array];
  id v5 = [(VOTImageExplorerImageView *)self _axNearbyRelationsForFeature:v4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B9C0;
  v8[3] = &unk_100024BA0;
  v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v6;
}

- (NSArray)visionFeatures
{
  return self->_visionFeatures;
}

- (void)setElements:(id)a3
{
}

- (void)setAxSortedElements:(id)a3
{
}

- (NSMutableArray)ocrFeatures
{
  return self->_ocrFeatures;
}

- (void)setOcrFeatures:(id)a3
{
}

- (NSMutableArray)objectClassificationFeatures
{
  return self->_objectClassificationFeatures;
}

- (void)setObjectClassificationFeatures:(id)a3
{
}

- (NSMutableArray)sceneClassificationFeatures
{
  return self->_sceneClassificationFeatures;
}

- (void)setSceneClassificationFeatures:(id)a3
{
}

- (NSMutableArray)faceFeatures
{
  return self->_faceFeatures;
}

- (void)setFaceFeatures:(id)a3
{
}

- (NSMutableArray)peopleFeatures
{
  return self->_peopleFeatures;
}

- (void)setPeopleFeatures:(id)a3
{
}

- (NSMutableDictionary)imageExplorerRotorCache
{
  return self->_imageExplorerRotorCache;
}

- (void)setImageExplorerRotorCache:(id)a3
{
}

- (NSArray)filteredRowFeatures
{
  return self->_filteredRowFeatures;
}

- (void)setFilteredRowFeatures:(id)a3
{
}

- (NSArray)filteredColumnFeatures
{
  return self->_filteredColumnFeatures;
}

- (void)setFilteredColumnFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredColumnFeatures, 0);
  objc_storeStrong((id *)&self->_filteredRowFeatures, 0);
  objc_storeStrong((id *)&self->_imageExplorerRotorCache, 0);
  objc_storeStrong((id *)&self->_peopleFeatures, 0);
  objc_storeStrong((id *)&self->_faceFeatures, 0);
  objc_storeStrong((id *)&self->_sceneClassificationFeatures, 0);
  objc_storeStrong((id *)&self->_objectClassificationFeatures, 0);
  objc_storeStrong((id *)&self->_ocrFeatures, 0);
  objc_storeStrong((id *)&self->_axSortedElements, 0);
  objc_storeStrong((id *)&self->_elements, 0);

  objc_storeStrong((id *)&self->_visionFeatures, 0);
}

@end