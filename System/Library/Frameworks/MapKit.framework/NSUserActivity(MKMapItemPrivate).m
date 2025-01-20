@interface NSUserActivity(MKMapItemPrivate)
- (void)_mapkit_clearMapItemDonationFields;
- (void)_mapkit_populateFieldsForDonationOfMapItem:()MKMapItemPrivate;
@end

@implementation NSUserActivity(MKMapItemPrivate)

- (void)_mapkit_clearMapItemDonationFields
{
  objc_getAssociatedObject(a1, &_MergedGlobals_175);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v4 integerValue];
  objc_setAssociatedObject(a1, &_MergedGlobals_175, 0, (void *)0x301);
  if (v2 >= 1)
  {
    v3 = [a1 _internalUserActivity];
    [v3 updateForwardToCoreSpotlightIndexer:(char)-(char)v2];
  }
}

- (void)_mapkit_populateFieldsForDonationOfMapItem:()MKMapItemPrivate
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 contentAttributeSet];
    v6 = (void *)[v5 copy];

    if (!v6)
    {
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x2050000000;
      v7 = (void *)qword_1EB316228;
      uint64_t v39 = qword_1EB316228;
      if (!qword_1EB316228)
      {
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __getCSSearchableItemAttributeSetClass_block_invoke;
        v35[3] = &unk_1E54B8448;
        v35[4] = &v36;
        __getCSSearchableItemAttributeSetClass_block_invoke((uint64_t)v35);
        v7 = (void *)v37[3];
      }
      id v8 = v7;
      _Block_object_dispose(&v36, 8);
      id v9 = objc_alloc((Class)v8);
      v10 = [a1 activityType];
      v6 = (void *)[v9 initWithItemContentType:v10];
    }
    v11 = [v4 name];
    [v6 setNamedLocation:v11];

    v12 = NSNumber;
    [v4 _coordinate];
    v13 = objc_msgSend(v12, "numberWithDouble:");
    [v6 setLatitude:v13];

    v14 = NSNumber;
    [v4 _coordinate];
    v16 = [v14 numberWithDouble:v15];
    [v6 setLongitude:v16];

    v17 = [v4 phoneNumber];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      v19 = [v6 phoneNumbers];
      if ([v19 count])
      {
        v20 = [v6 phoneNumbers];
        v21 = [v4 phoneNumber];
        v22 = [v20 arrayByAddingObject:v21];
        [v6 setPhoneNumbers:v22];
      }
      else
      {
        v20 = [v4 phoneNumber];
        v40[0] = v20;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
        [v6 setPhoneNumbers:v21];
      }
    }
    v23 = [v4 placemark];
    v24 = [v23 thoroughfare];
    [v6 setThoroughfare:v24];

    v25 = [v23 subThoroughfare];
    [v6 setSubThoroughfare:v25];

    v26 = [v23 postalCode];
    [v6 setPostalCode:v26];

    v27 = [v23 locality];
    [v6 setCity:v27];

    v28 = [v23 administrativeArea];
    [v6 setStateOrProvince:v28];

    v29 = [v23 country];
    [v6 setCountry:v29];

    v30 = [v4 _addressFormattedAsSinglelineAddress];
    [v6 setFullyFormattedAddress:v30];

    [a1 setContentAttributeSet:v6];
    v31 = objc_getAssociatedObject(a1, &_MergedGlobals_175);
    uint64_t v32 = [v31 integerValue] + 1;
    v33 = [NSNumber numberWithInteger:v32];
    objc_setAssociatedObject(a1, &_MergedGlobals_175, v33, (void *)0x301);

    v34 = [a1 _internalUserActivity];
    [v34 updateForwardToCoreSpotlightIndexer:(char)v32];
  }
}

@end