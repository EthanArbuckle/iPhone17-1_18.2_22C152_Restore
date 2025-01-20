@interface MKTransitIncidentStringProvider
+ (id)cellSecondaryTextForIncident:(id)a3;
+ (id)cellTitleForIncident:(id)a3;
@end

@implementation MKTransitIncidentStringProvider

+ (id)cellTitleForIncident:(id)a3
{
  return (id)[a3 title];
}

+ (id)cellSecondaryTextForIncident:(id)a3
{
  id v3 = a3;
  v4 = [v3 messageForRoutePlanning];
  if (![v4 length])
  {
    uint64_t v5 = [v3 title];
    if (v5
      && (v6 = (void *)v5,
          [v3 summary],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      v8 = NSString;
      _MKLocalizedStringFromThisBundle(@"Transit_Incident_Title_And_Summary");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v3 title];
      v11 = [v3 summary];
      uint64_t v12 = objc_msgSend(v8, "stringWithFormat:", v9, v10, v11);

      v4 = (void *)v10;
    }
    else
    {
      v13 = [v3 title];
      if (v13)
      {
        id v9 = v13;
        uint64_t v12 = (uint64_t)v9;
      }
      else
      {
        uint64_t v12 = [v3 summary];
        id v9 = 0;
      }
    }

    v4 = (void *)v12;
  }

  return v4;
}

@end