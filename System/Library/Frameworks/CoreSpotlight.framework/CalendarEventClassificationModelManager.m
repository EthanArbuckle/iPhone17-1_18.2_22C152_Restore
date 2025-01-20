@interface CalendarEventClassificationModelManager
+ (id)sharedInstance;
- (BOOL)isLoaded;
- (BOOL)loadModel;
- (CalendarEventClassificationModel)calendarEventClassificationModel;
- (CalendarEventClassificationModelManager)init;
- (SRResources)resources;
- (id)predictForReferenceItemId:(id)a3 withEmbedding:(id)a4;
- (void)setCalendarEventClassificationModel:(id)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setResources:(id)a3;
@end

@implementation CalendarEventClassificationModelManager

+ (id)sharedInstance
{
  if (qword_1000F91D0 != -1) {
    dispatch_once(&qword_1000F91D0, &stru_1000DC1C8);
  }
  v2 = (void *)qword_1000F91C8;

  return v2;
}

- (CalendarEventClassificationModelManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)CalendarEventClassificationModelManager;
  v2 = [(CalendarEventClassificationModelManager *)&v14 init];
  if (v2)
  {
    v3 = +[SRResourcesManager sharedResourcesManager];
    v4 = +[NSLocale currentLocale];
    [v3 loadAllParametersForClient:@"SpotlightKnowledge" locale:v4];

    v5 = +[SRResourcesManager sharedResourcesManager];
    v6 = +[NSLocale localeWithLocaleIdentifier:@"root"];
    v7 = [v5 resourcesForClient:@"SpotlightKnowledge" locale:v6 options:&off_1000E6EF0];
    [(CalendarEventClassificationModelManager *)v2 setResources:v7];

    [(CalendarEventClassificationModelManager *)v2 setIsLoaded:0];
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SpotlightKnowledge.CalendarClassificationModel", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007D030;
    block[3] = &unk_1000DA128;
    v13 = v2;
    dispatch_sync(v10, block);
  }
  return v2;
}

- (BOOL)loadModel
{
  if ([(CalendarEventClassificationModelManager *)self isLoaded]) {
    return 1;
  }
  [(CalendarEventClassificationModelManager *)self setIsLoaded:0];
  v4 = [(CalendarEventClassificationModelManager *)self resources];
  id v18 = 0;
  v5 = [v4 filePathArrayForKey:@"DocumentUnderstanding" didFailWithError:&v18];
  id v6 = v18;

  if ([v5 count])
  {
    v7 = +[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", @"ios"];
    dispatch_queue_t v8 = [v5 filteredArrayUsingPredicate:v7];
    v9 = [v8 firstObject];

    v10 = sub_100050990();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1000A3150();
      }

      v11 = +[NSURL fileURLWithPath:v9];
      id v17 = v6;
      v12 = [[CalendarEventClassificationModel alloc] initWithContentsOfURL:v11 error:&v17];
      id v13 = v17;

      [(CalendarEventClassificationModelManager *)self setCalendarEventClassificationModel:v12];
      objc_super v14 = sub_100050990();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000A30E8();
        }

        BOOL v3 = 0;
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_1000A30A4(v15);
        }

        BOOL v3 = 1;
        [(CalendarEventClassificationModelManager *)self setIsLoaded:1];
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000A303C();
      }
      BOOL v3 = 0;
      id v13 = v6;
    }

    id v6 = v13;
  }
  else
  {
    v9 = sub_100050990();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000A303C();
    }
    BOOL v3 = 0;
  }

  return v3;
}

- (id)predictForReferenceItemId:(id)a3 withEmbedding:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isLoaded
    || (queue = self->_queue,
        block[0] = _NSConcreteStackBlock,
        block[1] = 3221225472,
        block[2] = sub_10007D918,
        block[3] = &unk_1000DA128,
        void block[4] = self,
        dispatch_sync(queue, block),
        self->_isLoaded))
  {
    id v9 = v7;
    v10 = v9;
    if (v9
      && ([v9 format] == (id)1 || !objc_msgSend(v10, "format"))
      && ([v10 primaryEmbeddings],
          v11 = objc_claimAutoreleasedReturnValue(),
          id v12 = [v11 count],
          v11,
          v12))
    {
      id v13 = [v10 primaryEmbeddings];
      id v14 = [v13 firstObject];

      if ([v10 format] == (id)1)
      {
        id v15 = v14;
        unint64_t v16 = (unint64_t)[v15 length];
        id v17 = [objc_alloc((Class)NSMutableData) initWithLength:4 * (v16 >> 1)];
        id v18 = v15;
        v19 = (__int16 *)[v18 bytes];
        id v14 = v17;
        v20 = [v14 mutableBytes];
        if (v16 >= 2)
        {
          if (v16 >> 1 <= 1) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = v16 >> 1;
          }
          do
          {
            __int16 v22 = *v19++;
            _H0 = v22;
            __asm { FCVT            S0, H0 }
            *v20++ = _S0;
            --v21;
          }
          while (v21);
        }
      }
      unint64_t v29 = (unint64_t)[v14 length];
      id v30 = v14;
      v31 = (int *)[v30 bytes];
      v32 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v29 >> 2];
      if (v29 >= 4)
      {
        if (v29 >> 2 <= 1) {
          uint64_t v34 = 1;
        }
        else {
          uint64_t v34 = v29 >> 2;
        }
        do
        {
          int v35 = *v31++;
          LODWORD(v33) = v35;
          v36 = +[NSNumber numberWithFloat:v33];
          [v32 addObject:v36];

          --v34;
        }
        while (v34);
      }
    }
    else
    {
      v32 = 0;
    }

    if (![v32 count])
    {
      v41 = sub_100050990();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_1000A322C();
      }
      v47 = 0;
      goto LABEL_54;
    }
    id v37 = objc_alloc((Class)MLMultiArray);
    v77[0] = &off_1000E62A0;
    v38 = +[NSNumber numberWithUnsignedInteger:[v32 count]];
    v77[1] = v38;
    v39 = +[NSArray arrayWithObjects:v77 count:2];
    id v72 = 0;
    id v40 = [v37 initWithShape:v39 dataType:65568 error:&v72];
    v41 = v72;

    if (v41 || !v40)
    {
      v48 = sub_100050990();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_1000A3418();
      }
      v47 = 0;
      goto LABEL_53;
    }
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10007D920;
    v70[3] = &unk_1000DC1F0;
    v42 = v40;
    v71 = v42;
    [v32 enumerateObjectsUsingBlock:v70];
    v43 = [[CalendarEventClassificationModelInput alloc] initWithEmb:v42];
    calendarEventClassificationModel = self->_calendarEventClassificationModel;
    id v69 = 0;
    v45 = [(CalendarEventClassificationModel *)calendarEventClassificationModel predictionFromFeatures:v43 error:&v69];
    v41 = v69;
    if (v41)
    {
      v46 = sub_100050990();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_1000A33B0();
      }
    }
    else
    {
      if (v45)
      {
        v49 = [v45 y];
        id v50 = [v49 count];

        if (v50)
        {
          v51 = sub_100050990();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
            sub_1000A32FC((uint64_t)v6, v45, v51);
          }

          v52 = [v45 y];
          v53 = [v52 objectAtIndexedSubscript:0];
          [v53 floatValue];
          float v55 = v54;

          v56 = [v45 y];
          uint64_t v57 = (uint64_t)[v56 count];

          if (v57 < 2) {
            goto LABEL_58;
          }
          id v68 = v6;
          uint64_t v58 = 0;
          uint64_t v59 = 1;
          do
          {
            v60 = objc_msgSend(v45, "y", v68);
            v61 = [v60 objectAtIndexedSubscript:v59];
            [v61 floatValue];
            float v63 = v62;

            if (v63 > v55)
            {
              uint64_t v58 = v59;
              float v55 = v63;
            }
            ++v59;
            v64 = [v45 y];
            id v65 = [v64 count];
          }
          while (v59 < (uint64_t)v65);
          id v6 = v68;
          if (v58)
          {
            if (v58 == 1)
            {
              uint64_t v75 = CSEventTypeHotel;
              v66 = &v75;
            }
            else
            {
              if (v58 != 2)
              {
                v47 = &__NSArray0__struct;
                goto LABEL_52;
              }
              uint64_t v74 = CSEventTypeAppointment;
              v66 = &v74;
            }
          }
          else
          {
LABEL_58:
            uint64_t v76 = CSEventTypeFlight;
            v66 = &v76;
          }
          v47 = +[NSArray arrayWithObjects:v66 count:1];
LABEL_52:

          v48 = v71;
LABEL_53:

LABEL_54:
          goto LABEL_55;
        }
      }
      v46 = sub_100050990();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_1000A3294();
      }
    }

    v47 = 0;
    goto LABEL_52;
  }
  v32 = sub_100050990();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_1000A31C4();
  }
  v47 = 0;
LABEL_55:

  return v47;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (CalendarEventClassificationModel)calendarEventClassificationModel
{
  return (CalendarEventClassificationModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCalendarEventClassificationModel:(id)a3
{
}

- (SRResources)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_calendarEventClassificationModel, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end