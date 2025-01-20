@interface MapsSuggestionsResumeRouteImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsResumeRouteImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteImprover.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 44;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsResumeRouteImprover improveEntry:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (entry)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      v15 = v6;
      uint32_t v16 = 38;
LABEL_16:
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    }
LABEL_17:
    char v17 = 0;
LABEL_62:

    goto LABEL_63;
  }
  if ([v4 type] == 11)
  {
    if ([v5 containsKey:@"MapsSuggestionsWhenItHappenedKey"])
    {
      v6 = [v5 geoMapItem];

      if (!v6)
      {
LABEL_38:
        v29 = [v5 stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
        if ([v29 length])
        {
          v30 = [v5 routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
          if (v30)
          {
            if ([v5 containsKey:@"MapsSuggestionsResumeRouteWaypointIndex"])
            {
              unint64_t v31 = [v5 uint64ForKey:@"MapsSuggestionsResumeRouteWaypointIndex"] + 1;
              if (v31 < [v30 waypointsCount])
              {
                uint64_t v32 = MapsSuggestionsLocalizedMultipointRouteStopsString([v30 waypointsCount] - v31);

                v6 = v32;
              }
            }
          }
          id v33 = v5;
          if (self)
          {
            GEOConfigGetDouble();
            double v35 = v34;
            v36 = [v33 dateForKey:@"MapsSuggestionsWhenItHappenedKey"];
            v37 = MapsSuggestionsNow();
            [v36 timeIntervalSinceDate:v37];
            double v39 = -v38;

            GEOConfigGetDouble();
            double v41 = v40;
            if (v35 <= v39)
            {
              GEOConfigGetDouble();
              double v43 = v42;
              GEOConfigGetDouble();
              double v41 = v41 + -(v41 - v43) / (v44 - v35) * (v39 - v35);
            }
            [v33 setWeight:v41];
            v45 = [NSNumber numberWithInteger:GEOConfigGetInteger()];
            [v33 setNumber:v45 forKey:@"MapsSuggestionsSinkRankKey"];
          }
          [v33 setBoolean:1 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
          v46 = MapsSuggestionsLocalizedTitleFormatForStandardResumeRouteEntry(v29);
          [v33 setString:v46 forKey:@"MapsSuggestionsResumeRouteDefaultTitle"];
          if (![v6 length])
          {
            id v47 = v29;

            uint64_t v48 = MapsSuggestionsLocalizedResumeRouteString();

            v46 = v47;
            v6 = v48;
          }
          v49 = [v33 numberForKey:@"MapsSuggestionsRequiredChargeForEVKey"];
          if (([v33 BOOLeanForKey:@"MapsSuggestionsIsResumingAnEVRoute" is:0] & 1) != 0
            || !v49
            || ([v49 floatValue], v50 == 0.0))
          {
            char v51 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v46, v33);
            if (v6) {
              char v52 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v6, v33);
            }
            else {
              char v52 = 0;
            }
            char v17 = v51 | v52;
          }
          else
          {
            [v49 floatValue];
            v60 = MapsSuggestionsLocalizedTitleFormatForEVResumeRouteEntryWithChargePercentage(v54);
            v55 = [v33 stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
            v56 = MapsSuggestionsLocalizedSubtitleFormatForEVResumeRouteEntry(v55);

            v57 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v60;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v56;
              _os_log_impl(&dword_1A70DF000, v57, OS_LOG_TYPE_INFO, "Setting title and subtitle when charging: %@, %@", buf, 0x16u);
            }

            [v33 setString:v60 forKey:@"MapsSuggestionsResumeRouteTitleWhenCharging"];
            [v33 setString:v56 forKey:@"MapsSuggestionsResumeRouteSubtitleWhenCharging"];
            char v58 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v60, v33);
            char v59 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v56, v33);

            char v17 = v58 | v59;
          }
        }
        else
        {
          v30 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v5;
            _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_ERROR, "Entry missing a MapsSuggestionsEntryTitleNameKey: %@", buf, 0xCu);
          }
          char v17 = 0;
        }

        goto LABEL_62;
      }
      id v7 = [v5 geoMapItem];
      v8 = v7;
      v9 = 0;
      if (!self || !v7)
      {
LABEL_32:

        if ([v9 count])
        {
          v28 = [v9 firstObject];
          [v5 setString:v28 forKey:@"MapsSuggestionsEntryTitleNameKey"];
        }
        if ((unint64_t)[v9 count] < 2)
        {
          v6 = 0;
        }
        else
        {
          v6 = [v9 lastObject];
        }

        goto LABEL_38;
      }
      v10 = [v7 name];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        id v12 = [v8 name];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&buf[24] = __Block_byref_object_copy__16;
        *(void *)&buf[32] = __Block_byref_object_dispose__16;
        id v63 = 0;
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = ___firstLineOfString_block_invoke_1;
        v61[3] = &unk_1E5CB8B80;
        v61[4] = buf;
        [v12 enumerateLinesUsingBlock:v61];
        id v13 = *(id *)(*(void *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        if (v13 && [v13 length])
        {
LABEL_20:
          v19 = [v8 contactName];
          BOOL v20 = [v19 length] == 0;

          if (v20)
          {
            v21 = v13;
            id v13 = 0;
          }
          else
          {
            v21 = [v8 contactName];
          }
          v22 = MapsSuggestionsMapItemHomeWorkSchoolName(v8);
          v23 = v22;
          if (v22)
          {
            id v24 = v22;

            v21 = v24;
          }
          v25 = [v8 eventName];
          BOOL v26 = [v25 length] == 0;

          if (v26)
          {
            v27 = v21;
            v21 = v13;
          }
          else
          {

            v27 = [v8 eventName];
          }
          if ([v27 length]) {
            v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v27, v21, 0);
          }
          else {
            v9 = 0;
          }

          goto LABEL_32;
        }
      }
      else
      {
        id v13 = 0;
      }
      uint64_t v18 = [v8 shortAddress];

      id v13 = (id)v18;
      goto LABEL_20;
    }
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v5;
      v14 = "Entry missing a MapsSuggestionsWhenItHappenedKey: %@";
      v15 = v6;
      uint32_t v16 = 12;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  char v17 = 0;
LABEL_63:

  return v17;
}

@end