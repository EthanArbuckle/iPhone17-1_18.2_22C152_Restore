@interface CUIKIcon
- (CUIKIcon)initWithDate:(id)a3 calendar:(id)a4 format:(int64_t)a5;
- (CUIKIcon)initWithDateComponents:(id)a3 calendar:(id)a4 format:(int64_t)a5 forceNoTextEffects:(BOOL)a6;
- (CUIKIconGenerator)iconGenerator;
- (ISIcon)internalIcon;
- (NSCalendar)calendar;
- (NSDateComponents)dateComponents;
- (id)imageForDescriptor:(id)a3;
- (id)prepareImageForDescriptor:(id)a3;
- (int64_t)format;
- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4;
- (void)prepareImagesForImageDescriptors:(id)a3;
- (void)setInternalIcon:(id)a3;
@end

@implementation CUIKIcon

- (CUIKIcon)initWithDate:(id)a3 calendar:(id)a4 format:(int64_t)a5
{
  id v8 = a4;
  v9 = [v8 components:542 fromDate:a3];
  v10 = [(CUIKIcon *)self initWithDateComponents:v9 calendar:v8 format:a5 forceNoTextEffects:0];

  return v10;
}

- (CUIKIcon)initWithDateComponents:(id)a3 calendar:(id)a4 format:(int64_t)a5 forceNoTextEffects:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CUIKIcon;
  v12 = (CUIKIcon *)[(CUIKIcon *)&v26 _init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    dateComponents = v12->_dateComponents;
    v12->_dateComponents = (NSDateComponents *)v13;

    v15 = [MEMORY[0x1E4F57710] shared];
    int v16 = [v15 stopTimeDemoModeActive];

    if (v16)
    {
      v17 = [MEMORY[0x1E4F57710] shared];
      v18 = [v17 stopTimeDemoModeComponents];
      uint64_t v19 = [v18 copy];
      v20 = v12->_dateComponents;
      v12->_dateComponents = (NSDateComponents *)v19;
    }
    uint64_t v21 = [v11 copy];
    calendar = v12->_calendar;
    v12->_calendar = (NSCalendar *)v21;

    v12->_format = a5;
    v23 = [[CUIKDefaultIconGenerator alloc] initWithForceNoTextEffects:v6];
    iconGenerator = v12->_iconGenerator;
    v12->_iconGenerator = (CUIKIconGenerator *)v23;
  }
  return v12;
}

- (void)prepareImagesForImageDescriptors:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  internalIcon = self->_internalIcon;
  self->_internalIcon = 0;

  v37 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        [v10 size];
        double v12 = v11;
        double v14 = v13;
        [v10 scale];
        double v16 = v15;
        uint64_t v17 = [v10 appearance];
        v18 = +[CUIKLogSubsystem defaultCategory];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v24 = [(CUIKIcon *)self dateComponents];
          v35 = [(CUIKIcon *)self calendar];
          v25 = [v35 calendarIdentifier];
          int64_t v26 = [(CUIKIcon *)self format];
          v27 = [NSNumber numberWithInteger:v17];
          *(_DWORD *)buf = 138544898;
          v43 = v24;
          __int16 v44 = 2114;
          v45 = v25;
          __int16 v46 = 2048;
          int64_t v47 = v26;
          __int16 v48 = 2048;
          double v49 = v12;
          __int16 v50 = 2048;
          double v51 = v14;
          __int16 v52 = 2048;
          double v53 = v16;
          __int16 v54 = 2112;
          v55 = v27;
          _os_log_debug_impl(&dword_1BDF08000, v18, OS_LOG_TYPE_DEBUG, "Request to prepare icon with dateComponents: %{public}@, calendar: %{public}@, format: %ld, size: (%f, %f), scale: %f, appearance: %@", buf, 0x48u);
        }
        uint64_t v19 = [(CUIKIcon *)self iconGenerator];
        v20 = [(CUIKIcon *)self dateComponents];
        uint64_t v21 = [(CUIKIcon *)self calendar];
        v22 = (const void *)objc_msgSend(v19, "iconImageWithDateComponents:calendar:format:size:scale:appearance:", v20, v21, -[CUIKIcon format](self, "format"), v17, v12, v14, v16);

        if (v22)
        {
          v23 = [objc_alloc(MEMORY[0x1E4F6F1E8]) initWithCGImage:v22 scale:v16];
          CFRelease(v22);
          [v37 addObject:v23];
        }
        else
        {
          v23 = +[CUIKLogSubsystem defaultCategory];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v28 = [(CUIKIcon *)self dateComponents];
            v29 = [(CUIKIcon *)self calendar];
            v30 = [v29 calendarIdentifier];
            int64_t v31 = [(CUIKIcon *)self format];
            v32 = [NSNumber numberWithInteger:v17];
            *(_DWORD *)buf = 138544898;
            v43 = v28;
            __int16 v44 = 2114;
            v45 = v30;
            __int16 v46 = 2048;
            int64_t v47 = v31;
            __int16 v48 = 2048;
            double v49 = v12;
            __int16 v50 = 2048;
            double v51 = v14;
            __int16 v52 = 2048;
            double v53 = v16;
            __int16 v54 = 2112;
            v55 = v32;
            _os_log_error_impl(&dword_1BDF08000, v23, OS_LOG_TYPE_ERROR, "Failed to prepare icon with dateComponents: %{public}@, calendar: %{public}@, format: %ld, size: (%f, %f), scale: %f, appearance: %@", buf, 0x48u);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v56 count:16];
    }
    while (v7);
  }

  if ([v37 count])
  {
    v33 = (ISIcon *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithImages:v37];
    v34 = self->_internalIcon;
    self->_internalIcon = v33;
  }
}

- (id)prepareImageForDescriptor:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CUIKIcon *)self imageForDescriptor:v4];
  uint64_t v6 = v5;
  if (!v5 || [v5 placeholder])
  {
    v10[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(CUIKIcon *)self prepareImagesForImageDescriptors:v7];

    uint64_t v8 = [(CUIKIcon *)self imageForDescriptor:v4];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (id)imageForDescriptor:(id)a3
{
  return (id)[(ISIcon *)self->_internalIcon imageForDescriptor:a3];
}

- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = [(CUIKIcon *)self prepareImageForDescriptor:a3];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (int64_t)format
{
  return self->_format;
}

- (CUIKIconGenerator)iconGenerator
{
  return self->_iconGenerator;
}

- (ISIcon)internalIcon
{
  return self->_internalIcon;
}

- (void)setInternalIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalIcon, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end