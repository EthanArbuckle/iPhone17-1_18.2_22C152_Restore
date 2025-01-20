@interface VKLabelMarker(MapKitExtras)
- (BOOL)_mapkit_hasMUID;
- (MKMapItemIdentifier)flyoverTourIdentifier;
- (MKMapItemIdentifier)identifier;
- (id)_annotationTitle;
- (uint64_t)_mapkit_muid;
- (uint64_t)suppressCallout;
- (void)setSuppressCallout:()MapKitExtras;
@end

@implementation VKLabelMarker(MapKitExtras)

- (BOOL)_mapkit_hasMUID
{
  return ([a1 hasBusinessID] & 1) != 0 || objc_msgSend(a1, "featureID") != 0;
}

- (uint64_t)_mapkit_muid
{
  if ([a1 hasBusinessID])
  {
    return [a1 businessID];
  }
  else
  {
    return [a1 featureID];
  }
}

- (MKMapItemIdentifier)identifier
{
  [a1 coordinate];
  double v3 = v2;
  [a1 coordinate];
  v5 = -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([MKMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", objc_msgSend(a1, "_mapkit_muid"), 0, v3, v4);

  return v5;
}

- (MKMapItemIdentifier)flyoverTourIdentifier
{
  if ([a1 isFlyoverTour])
  {
    [a1 coordinate];
    double v3 = v2;
    [a1 coordinate];
    v5 = -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([MKMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", [a1 featureID], 0, v3, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_annotationTitle
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([a1 featureType] == 6
    && ([a1 relatedTexts],
        double v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 count],
        v2,
        v3))
  {
    double v4 = [a1 relatedTexts];
    objc_msgSend(v4, "_mapkit_componentsJoinedInCommaDelimitedList");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([a1 isTransitLine])
  {
    v6 = [a1 relatedSubTexts];
    uint64_t v7 = [a1 countFeatureIDs];
    v8 = (void *)v7;
    if (v7)
    {
      if (v7 == 1)
      {
        v8 = [v6 firstObject];
      }
      else
      {
        v9 = _MKLocalizedStringFromThisBundle(@"%d lines");
        v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v9, v8);
      }
    }
    if (![v8 length])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v10 = [a1 imageKeys];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
LABEL_13:
        uint64_t v14 = 0;
        v15 = v8;
        while (1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v8 = [*(id *)(*((void *)&v22 + 1) + 8 * v14) shieldText];

          if ([v8 length]) {
            break;
          }
          ++v14;
          v15 = v8;
          if (v12 == v14)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v12) {
              goto LABEL_13;
            }
            break;
          }
        }
      }
    }
    if (![v8 length])
    {
      v16 = [a1 transitSystems];
      uint64_t v17 = [v16 count];

      if (v17 == 1)
      {
        v18 = [a1 transitSystems];
        uint64_t v19 = [v18 firstObject];

        v8 = (void *)v19;
      }
    }
    if (![v8 length])
    {
      uint64_t v20 = [a1 text];

      v8 = (void *)v20;
    }
    id v5 = v8;
  }
  else
  {
    id v5 = [a1 text];
  }

  return v5;
}

- (uint64_t)suppressCallout
{
  v1 = objc_getAssociatedObject(a1, &_MKLabelMarkerShowCallout);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setSuppressCallout:()MapKitExtras
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_MKLabelMarkerShowCallout, v2, (void *)0x303);
}

@end