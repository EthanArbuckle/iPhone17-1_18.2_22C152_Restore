@interface SAGKLinkedAnswer
- (id)sirigk_cardSection;
@end

@implementation SAGKLinkedAnswer

- (id)sirigk_cardSection
{
  v3 = [(SAGKLinkedAnswer *)self name];
  v4 = +[SFRichText textWithString:v3];

  [v4 setMaxLines:3];
  v5 = [(SAGKLinkedAnswer *)self descriptionText];
  v6 = +[SFRichText textWithString:v5];

  [v6 setMaxLines:2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(SAGKLinkedAnswer *)self publicationDate],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = self;
    v9 = [(SAGKLinkedAnswer *)v8 displayLink];
    v10 = [(SAGKLinkedAnswer *)v8 publicationDate];

    id v11 = v10;
    if (qword_208F8 != -1) {
      dispatch_once(&qword_208F8, &stru_18610);
    }
    v12 = +[NSCalendar currentCalendar];
    v13 = +[NSDate date];
    v14 = [v12 components:4348 fromDate:v11 toDate:v13 options:0];

    if ((uint64_t)[v14 year] <= 0)
    {
      if ((uint64_t)[v14 month] <= 0)
      {
        if ((uint64_t)[v14 weekOfMonth] <= 0)
        {
          if ((uint64_t)[v14 day] <= 0)
          {
            if ((uint64_t)[v14 hour] <= 0)
            {
              if ((uint64_t)[v14 minute] <= 0) {
                uint64_t v15 = 128;
              }
              else {
                uint64_t v15 = 64;
              }
            }
            else
            {
              uint64_t v15 = 32;
            }
          }
          else
          {
            uint64_t v15 = 16;
          }
        }
        else
        {
          uint64_t v15 = 4096;
        }
      }
      else
      {
        uint64_t v15 = 8;
      }
    }
    else
    {
      uint64_t v15 = 4;
    }
    [(id)qword_208F0 setAllowedUnits:v15];
    v17 = [(id)qword_208F0 stringFromDateComponents:v14];

    v18 = +[NSString stringWithFormat:@"%@ - %@", v9, v17];
    v16 = +[SFRichText textWithString:v18];
  }
  else
  {
    v9 = [(SAGKLinkedAnswer *)self displayLink];
    v16 = +[SFRichText textWithString:v9];
  }

  v19 = [(SAGKLinkedAnswer *)self thumbnails];
  if ([v19 count])
  {
    v20 = [v19 firstObject];
    id v21 = objc_alloc((Class)SFURLImage);
    v22 = [v20 resourceUrl];
    id v23 = [v21 initWithURL:v22];

    objc_msgSend(v23, "setSize:", 50.0, 50.0);
    [v23 setCornerRoundingStyle:2];
  }
  else
  {
    id v23 = 0;
  }
  id v24 = objc_alloc_init((Class)SFDetailedRowCardSection);
  [v24 setTitle:v4];
  v27 = v6;
  v25 = +[NSArray arrayWithObjects:&v27 count:1];
  [v24 setDescriptions:v25];

  [v24 setFootnote:v16];
  if (v23) {
    [v24 setThumbnail:v23];
  }

  return v24;
}

@end