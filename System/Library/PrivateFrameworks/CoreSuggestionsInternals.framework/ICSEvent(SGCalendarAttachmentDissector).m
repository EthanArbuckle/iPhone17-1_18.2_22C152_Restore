@interface ICSEvent(SGCalendarAttachmentDissector)
- (SGPipelineEnrichment)enrichmentWithParentEntity:()SGCalendarAttachmentDissector withCalendar:withCorrectnessFlag:;
- (id)attendeeEmailAddresses;
- (id)enrichmentWithParentEntity:()SGCalendarAttachmentDissector withCalendar:;
- (uint64_t)method;
@end

@implementation ICSEvent(SGCalendarAttachmentDissector)

- (SGPipelineEnrichment)enrichmentWithParentEntity:()SGCalendarAttachmentDissector withCalendar:withCorrectnessFlag:
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 dtstart];
  if (v10)
  {
    v11 = [a1 dtstart];
    v12 = [v11 validatedCompleteDateTime];
  }
  else
  {
    v12 = 0;
  }

  uint64_t v13 = [a1 dtend];
  if (v13
    && (v14 = (void *)v13,
        [a1 dtend],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v15 validatedCompleteDateTime],
        id v16 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v16))
  {
    int v17 = 0;
  }
  else
  {
    id v16 = v12;
    int v17 = 1;
  }
  v18 = 0;
  if (v12)
  {
    if (v16)
    {
      v18 = [v12 components];
      if (v18)
      {
        v19 = [v16 components];

        if (!v19)
        {
          v18 = 0;
          goto LABEL_92;
        }
        int v105 = v17;
        v20 = [a1 uid];
        v21 = v20;
        id v115 = v9;
        id v109 = v8;
        if (v20)
        {
          id v22 = v20;
        }
        else
        {
          id v23 = [NSString alloc];
          v24 = [a1 dtstart];
          v25 = [v24 value];
          v26 = [a1 summary];
          v27 = (void *)[v23 initWithFormat:@"%@;%@", v25, v26];
          uint64_t v28 = SGSha256ForString(v27, 0);

          id v9 = v115;
          id v8 = v109;
          id v22 = (id)v28;
        }

        v29 = [v8 duplicateKey];
        uint64_t v30 = +[SGDuplicateKey duplicateKeyForPseudoEventWithGroupId:v22 parentKey:v29];

        v31 = [SGPipelineEnrichment alloc];
        v32 = [a1 summary];
        v108 = (void *)v30;
        v33 = [(SGPipelineEnrichment *)v31 initWithDuplicateKey:v30 title:v32 parent:v8];

        v34 = [a1 description];
        [(SGEntity *)v33 setContent:v34];

        v35 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:32 modelVersion:0 confidence:0];
        [(SGEntity *)v33 setExtractionInfo:v35];

        v36 = [MEMORY[0x1E4F5D9F0] fromCalendarAttachment];
        [(SGEntity *)v33 addTag:v36];

        v37 = [a1 url];

        if (v37)
        {
          v38 = (void *)MEMORY[0x1E4F5D9F0];
          v39 = [a1 url];
          v40 = [v38 url:v39];
          [(SGEntity *)v33 addTag:v40];
        }
        v111 = v33;
        v112 = [v12 components];
        v41 = [v16 components];
        v42 = [a1 firstValueOfPropertyForName:*MEMORY[0x1E4FB82C0]];
        v107 = v22;
        if (v42)
        {
          BOOL v43 = 1;
        }
        else
        {
          v44 = [a1 firstValueOfPropertyForName:*MEMORY[0x1E4FB82C8]];
          if (v44)
          {
            BOOL v43 = 1;
          }
          else
          {
            v45 = objc_msgSend(v9, "x_wr_timezone");
            BOOL v43 = v45 != 0;
          }
        }

        v46 = [v12 tzid];

        v47 = (uint64_t *)MEMORY[0x1E4F5DDF0];
        v48 = (void *)MEMORY[0x1E4F5DDE0];
        if (v46 || v43)
        {
          v49 = [v12 systemTimeZoneWithCalendar:v115 withEvent:a1 withCorrectnessFlag:a5];
          [v112 setTimeZone:v49];

          v50 = [v112 timeZone];

          if (v50) {
            v51 = (void *)MEMORY[0x1E4F5DDF8];
          }
          else {
            v51 = (void *)MEMORY[0x1E4F5DDE8];
          }
          [MEMORY[0x1E4F5DB68] recordWithTimezoneValue:*v51 datetimeType:*v48];
          v47 = (uint64_t *)MEMORY[0x1E4F5DDF0];
        }
        else
        {
          [MEMORY[0x1E4F5DB68] recordWithTimezoneValue:*MEMORY[0x1E4F5DDF0] datetimeType:*MEMORY[0x1E4F5DDE0]];
        }
        v52 = [v16 tzid];
        if (v52) {
          int v53 = 1;
        }
        else {
          int v53 = v43;
        }

        v54 = (uint64_t *)MEMORY[0x1E4F5DDD8];
        id v9 = v115;
        if (v53 == 1)
        {
          v55 = [v16 systemTimeZoneWithCalendar:v115 withEvent:a1 withCorrectnessFlag:a5];
          [v41 setTimeZone:v55];

          v56 = [v41 timeZone];

          v57 = (void *)MEMORY[0x1E4F5DB68];
          uint64_t v58 = *v54;
          if (v56) {
            v59 = (uint64_t *)MEMORY[0x1E4F5DDF8];
          }
          else {
            v59 = (uint64_t *)MEMORY[0x1E4F5DDE8];
          }
          uint64_t v60 = *v59;
        }
        else
        {
          v57 = (void *)MEMORY[0x1E4F5DB68];
          uint64_t v60 = *v47;
          uint64_t v58 = *MEMORY[0x1E4F5DDD8];
        }
        [v57 recordWithTimezoneValue:v60 datetimeType:v58];
        id v8 = v109;
        v61 = v112;
        v62 = [v112 timeZone];
        if (!v62)
        {
          v63 = [v12 tzid];

          if (!v63) {
            goto LABEL_44;
          }
          v62 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
          [v112 setTimeZone:v62];
        }

LABEL_44:
        v64 = [v41 timeZone];
        if (!v64)
        {
          v65 = [v16 tzid];

          if (!v65) {
            goto LABEL_48;
          }
          v64 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
          [v41 setTimeZone:v64];
        }

LABEL_48:
        v66 = [v12 tzid];
        if (!v66)
        {
          if ([v12 hasFloatingTimeZone]) {
            goto LABEL_52;
          }
          v67 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
          [v112 setTimeZone:v67];

          uint64_t v68 = convertDateComponentsToLocalTimeZone(v112);
          v66 = v112;
          v61 = (void *)v68;
        }

LABEL_52:
        v69 = [v16 tzid];
        if (!v69)
        {
          if ([v16 hasFloatingTimeZone])
          {
LABEL_56:
            v18 = 0;
            if (!v61 || !v41) {
              goto LABEL_91;
            }
            if (!v105) {
              goto LABEL_79;
            }
            v72 = [a1 duration];
            [v72 timeInterval];
            if (v73 == 0.0)
            {
            }
            else if (v72)
            {
              goto LABEL_68;
            }
            v74 = [a1 dtend];
            if (v74)
            {
              v75 = v74;
              char v76 = [v74 hasTimeComponent];

              if (v76) {
                goto LABEL_79;
              }
            }
            else
            {
              v77 = [a1 dtstart];
              char v78 = [v77 hasTimeComponent];

              if (v78) {
                goto LABEL_79;
              }
            }
            v72 = (void *)[objc_alloc(MEMORY[0x1E4FB7F50]) initWithWeeks:0 days:1 hours:0 minutes:0 seconds:0];
            if (!v72) {
              goto LABEL_79;
            }
LABEL_68:
            v113 = v61;
            v79 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
            uint64_t v80 = [v79 dateFromComponents:v41];
            if (!v80) {
              goto LABEL_89;
            }
            v81 = (void *)v80;
            v82 = objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 16, 7 * objc_msgSend(v72, "weeks"), v80, 0);

            if (!v82) {
              goto LABEL_89;
            }
            v83 = objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 16, objc_msgSend(v72, "days"), v82, 0);

            if (!v83) {
              goto LABEL_89;
            }
            v84 = objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 32, objc_msgSend(v72, "hours"), v83, 0);

            if (!v84
              || (objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 64, objc_msgSend(v72, "minutes"), v84, 0), v85 = objc_claimAutoreleasedReturnValue(), v84, !v85)|| (objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 128, objc_msgSend(v72, "seconds"), v85, 0), uint64_t v86 = objc_claimAutoreleasedReturnValue(), v85, !v86))
            {
LABEL_89:

              v18 = 0;
              v61 = v113;
LABEL_90:

LABEL_91:
              goto LABEL_92;
            }
            v87 = (void *)v86;
            v88 = [v41 timeZone];
            uint64_t v89 = (uint64_t)v88;
            if (!v88)
            {
              uint64_t v89 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
            }
            v106 = (void *)v89;
            uint64_t v110 = [v79 componentsInTimeZone:v89 fromDate:v87];

            if (!v88) {
            v41 = (void *)v110;
            }
            v61 = v113;
LABEL_79:
            v72 = [MEMORY[0x1E4F5DB40] rangeWithGregorianStartComponents:v61 endComponents:v41];
            if (v72)
            {
              v114 = v41;
              v90 = v61;
              [(SGEntity *)v111 setTimeRange:v72];
              v91 = [a1 location];

              if (v91)
              {
                v92 = [SGStorageLocation alloc];
                v93 = [a1 location];
                v94 = [(SGStorageLocation *)v92 initWithType:0 label:v93 address:0 airportCode:0 accuracy:0.0 quality:0.0];

                v95 = [(SGEntity *)v111 locations];
                [v95 addObject:v94];
              }
              uint64_t v96 = [a1 dtstamp];
              if (v96)
              {
                v97 = (void *)v96;
                v98 = [a1 dtstamp];
                v99 = [v98 validatedCompleteDateTime];

                if (v99)
                {
                  id v100 = objc_alloc(MEMORY[0x1E4F1C9A8]);
                  v101 = (void *)[v100 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
                  v102 = [v99 components];
                  v103 = [v101 dateFromComponents:v102];

                  if (v103)
                  {
                    [v103 timeIntervalSince1970];
                    -[SGPipelineEnrichment setCreationTimestamp:](v111, "setCreationTimestamp:");
                  }
                }
              }
              v18 = v111;
              v61 = v90;
              v41 = v114;
            }
            else
            {
              v18 = 0;
            }
            goto LABEL_90;
          }
          v70 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
          [v41 setTimeZone:v70];

          uint64_t v71 = convertDateComponentsToLocalTimeZone(v41);
          v69 = v41;
          v41 = (void *)v71;
        }

        goto LABEL_56;
      }
    }
  }
LABEL_92:

  return v18;
}

- (id)enrichmentWithParentEntity:()SGCalendarAttachmentDissector withCalendar:
{
  char v6 = 0;
  v4 = [a1 enrichmentWithParentEntity:a3 withCalendar:a4 withCorrectnessFlag:&v6];
  return v4;
}

- (uint64_t)method
{
  v1 = [a1 firstValueOfPropertyForName:*MEMORY[0x1E4FB8210]];
  uint64_t v2 = [v1 longValue];

  return v2;
}

- (id)attendeeEmailAddresses
{
  v1 = [a1 attendee];
  uint64_t v2 = sgMapAndFilter();

  return v2;
}

@end