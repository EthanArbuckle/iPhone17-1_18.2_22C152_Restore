@interface CalRecurrenceRuleDescriptionGenerator
+ (id)_andDaysOfWeekString:(id)a3;
+ (id)_customDayCombinationDescription:(id)a3;
+ (id)_dayOfMonthAsString:(int64_t)a3;
+ (id)_daysOfWeek;
+ (id)_numberedWeekDayString:(id)a3;
+ (id)_orDaysOfWeekString:(id)a3;
+ (id)_weekDayPositionAsString:(int64_t)a3;
+ (id)humanReadableDescriptionWithStartDate:(id)a3 ofRecurrenceRuleICSString:(id)a4 isConcise:(BOOL)a5;
+ (id)localizedOfMonthStringForMonth:(id)a3;
+ (int64_t)daysTypeForDayArray:(id)a3;
@end

@implementation CalRecurrenceRuleDescriptionGenerator

+ (id)localizedOfMonthStringForMonth:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  int v6 = [v4 intValue];

  if ((v6 - 1) > 0xB)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 localizedStringForKey:off_1E56CE488[v6 - 1] value:&stru_1EE0C39E0 table:0];
  }

  return v7;
}

+ (id)humanReadableDescriptionWithStartDate:(id)a3 ofRecurrenceRuleICSString:(id)a4 isConcise:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v183 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v180 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [MEMORY[0x1E4FB7F78] recurrenceRuleFromICSString:v8];
  v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v179 = [v10 components:536 fromDate:v7];

  v11 = [v9 interval];
  uint64_t v170 = [v11 integerValue];

  uint64_t v12 = [v9 freq];
  v188 = [v9 byday];
  v181 = v9;
  v182 = [v9 bymonth];
  if (!humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray)
  {
    v13 = [v183 standaloneWeekdaySymbols];
    uint64_t v14 = [v13 copy];
    v15 = (void *)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray;
    humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray = v14;

    if ([(id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray count] != 7)
    {
      NSLog(&cfstr_Nsdateformatte.isa);
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", 0);
      v17 = (void *)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray;
      humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray = v16;
    }
  }
  if (!humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray)
  {
    v18 = [v183 standaloneMonthSymbols];
    uint64_t v19 = [v18 copy];
    v20 = (void *)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray;
    humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray = v19;

    if ([(id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray count] != 12)
    {
      NSLog(&cfstr_Nsdateformatte_0.isa);
      uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", 0);
      v22 = (void *)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray;
      humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray = v21;
    }
  }
  switch(v12)
  {
    case 4:
      v23 = NSString;
      uint64_t v24 = v170;
      if (v170 == 1)
      {
        if (v5) {
          v25 = @"daily";
        }
        else {
          v25 = @"Event will occur every day.";
        }
        goto LABEL_115;
      }
      if (v5) {
        v70 = @"every %ld days";
      }
      else {
        v70 = @"Event will occur every %ld days.";
      }
      goto LABEL_117;
    case 5:
      v26 = v188;
      if (!v188
        || [v188 count] == 1
        && ([v188 objectAtIndexedSubscript:0],
            v27 = objc_claimAutoreleasedReturnValue(),
            uint64_t v28 = [v27 weekday],
            uint64_t v29 = [v179 weekday],
            v27,
            v26 = v188,
            v28 == v29))
      {
        v23 = NSString;
        uint64_t v24 = v170;
        if (v170 == 1)
        {
          if (v5) {
            v25 = @"weekly";
          }
          else {
            v25 = @"Event will occur every week.";
          }
LABEL_115:
          v105 = v180;
          v106 = [v180 localizedStringForKey:v25 value:&stru_1EE0C39E0 table:0];
        }
        else
        {
          if (v5) {
            v70 = @"every %ld weeks";
          }
          else {
            v70 = @"Event will occur every %ld weeks.";
          }
LABEL_117:
          v105 = v180;
          uint64_t v107 = v24;
          v106 = [v180 localizedStringForKey:v70 value:&stru_1EE0C39E0 table:0];
          uint64_t v159 = v107;
        }
        v108 = v23;
        v74 = v105;
        v73 = objc_msgSend(v108, "localizedStringWithFormat:", v106, v159);
        goto LABEL_253;
      }
      if (v170 != 1)
      {
        v71 = NSString;
        if (v5) {
          v92 = @"every %ld weeks on %@";
        }
        else {
          v92 = @"Event will occur every %ld weeks on %@.";
        }
        goto LABEL_251;
      }
      switch([(id)objc_opt_class() daysTypeForDayArray:v26])
      {
        case 0:
        case 3:
          v71 = NSString;
          if (v5) {
            v72 = @"every week on %@";
          }
          else {
            v72 = @"Event will occur every week on %@.";
          }
          goto LABEL_179;
        case 1:
          if (v5) {
            v140 = @"every day";
          }
          else {
            v140 = @"Event will occur every day.";
          }
          break;
        case 2:
          if (v5) {
            v140 = @"every weekday";
          }
          else {
            v140 = @"Event will occur every weekday.";
          }
          break;
        default:
          goto LABEL_79;
      }
      v74 = v180;
      v73 = [v180 localizedStringForKey:v140 value:&stru_1EE0C39E0 table:0];
      goto LABEL_254;
    case 6:
      if ([v182 count])
      {
        if ([v182 count])
        {
LABEL_19:
          BOOL v166 = v5;
          id v30 = v182;
          if ([v30 count] == 1)
          {
            v31 = [v30 objectAtIndex:0];
            uint64_t v32 = [v31 integerValue];
            BOOL v33 = v32 == [v179 month];
          }
          else
          {
            BOOL v33 = 0;
          }
          if (![v188 count] && (!objc_msgSend(v30, "count") || v33))
          {
            v35 = NSString;
            if (v170 < 2)
            {
              if (v166) {
                v110 = @"yearly";
              }
              else {
                v110 = @"Event will occur every year.";
              }
              v121 = v180;
              uint64_t v122 = [v180 localizedStringForKey:v110 value:&stru_1EE0C39E0 table:0];
            }
            else
            {
              if (v166) {
                v36 = @"every %ld years";
              }
              else {
                v36 = @"Event will occur every %ld years.";
              }
              v121 = v180;
              uint64_t v122 = [v180 localizedStringForKey:v36 value:&stru_1EE0C39E0 table:0];
              uint64_t v159 = v170;
            }
            v138 = v35;
            v74 = v121;
            v191 = (void *)v122;
            v73 = [v138 localizedStringWithFormat:v159];
            goto LABEL_248;
          }
          id v168 = v8;
          id v164 = v7;
          v191 = [MEMORY[0x1E4F28E78] string];
          v189 = [MEMORY[0x1E4F28E78] string];
          uint64_t v37 = [v30 count];
          if (v37)
          {
            unint64_t v38 = v37;
            uint64_t v39 = 0;
            id v186 = v30;
            while (1)
            {
              v40 = [v30 objectAtIndex:v39];
              v41 = v40;
              if (v39) {
                break;
              }
              if ([v40 integerValue] < 1 || objc_msgSend(v41, "integerValue") >= 13)
              {
                [v191 appendString:@"???"];
              }
              else
              {
                v48 = objc_msgSend((id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray, "objectAtIndex:", objc_msgSend(v41, "integerValue") - 1);
                [v191 appendString:v48];
              }
LABEL_65:

              if (v38 == ++v39) {
                goto LABEL_66;
              }
            }
            unint64_t v42 = v39 + 1;
            v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v44 = v43;
            if (v39 + 1 >= v38)
            {
              if (v38 == 2)
              {
                uint64_t v45 = [v43 localizedStringForKey:@" and %@" value:&stru_1EE0C39E0 table:0];
                int v47 = 0;
                int v46 = 1;
                v173 = v44;
                v174 = (void *)v45;
              }
              else
              {
                uint64_t v45 = [v43 localizedStringForKey:@"Recurrence rule last item format.  The last part of a list: X, Y and Z. Here %@ is 'Z'", @", and %@", 0 value table];
                int v46 = 0;
                int v47 = 1;
                v171 = v44;
                v172 = (void *)v45;
              }
            }
            else
            {
              uint64_t v45 = [v43 localizedStringForKey:@", %@", &stru_1EE0C39E0, 0 value table];
              int v46 = 0;
              int v47 = 0;
              v184 = v44;
              v185 = (void *)v45;
            }
            if ([v41 integerValue] < 1 || objc_msgSend(v41, "integerValue") >= 13)
            {
              objc_msgSend(v191, "appendFormat:", v45, @"???");
              if (!v47) {
                goto LABEL_48;
              }
            }
            else
            {
              v49 = objc_msgSend((id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray, "objectAtIndex:", objc_msgSend(v41, "integerValue") - 1);
              objc_msgSend(v191, "appendFormat:", v45, v49);

              if (!v47)
              {
LABEL_48:
                if (v46)
                {
                }
                if (v42 >= v38)
                {
                  v53 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                  v54 = v53;
                  if (v38 == 2)
                  {
                    uint64_t v50 = [v53 localizedStringForKey:@" and %@" value:&stru_1EE0C39E0 table:0];
                    int v52 = 0;
                    int v51 = 1;
                    v177 = v54;
                    v178 = (void *)v50;
                  }
                  else
                  {
                    uint64_t v50 = [v53 localizedStringForKey:@"Recurrence rule last item format.  The last part of a list: X, Y and Z. Here %@ is 'Z'", @", and %@", 0 value table];
                    int v51 = 0;
                    int v52 = 1;
                    v175 = v54;
                    v176 = (void *)v50;
                  }
                }
                else
                {

                  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                  uint64_t v50 = [v7 localizedStringForKey:@", %@", &stru_1EE0C39E0, 0 value table];
                  int v51 = 0;
                  int v52 = 0;
                  id v8 = (id)v50;
                }
                if ([v41 integerValue] < 1 || objc_msgSend(v41, "integerValue") >= 13)
                {
                  objc_msgSend(v189, "appendFormat:", v50, @"???");
                  if (!v52)
                  {
LABEL_61:
                    if (v51)
                    {
                    }
                    id v30 = v186;
                    if (v42 < v38)
                    {
                    }
                    goto LABEL_65;
                  }
                }
                else
                {
                  v55 = objc_msgSend((id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray, "objectAtIndex:", objc_msgSend(v41, "integerValue") - 1);
                  objc_msgSend(v189, "appendFormat:", v50, v55);

                  if (!v52) {
                    goto LABEL_61;
                  }
                }

                goto LABEL_61;
              }
            }

            goto LABEL_48;
          }
LABEL_66:
          v56 = [NSString string];
          if ([v30 count])
          {
            v57 = objc_opt_class();
            v58 = [v30 objectAtIndexedSubscript:0];
            v59 = [v57 localizedOfMonthStringForMonth:v58];

            uint64_t v60 = [NSString localizedStringWithValidatedFormat:v59, @"%@", 0, v189 validFormatSpecifiers error];

            v56 = (void *)v60;
          }
          v61 = [v181 bysetpos];
          uint64_t v62 = [v61 count];

          if (v62)
          {
            v63 = objc_opt_class();
            v64 = [v181 bysetpos];
            v65 = [v64 objectAtIndex:0];
            v66 = objc_msgSend(v63, "_weekDayPositionAsString:", objc_msgSend(v65, "integerValue"));

            uint64_t v67 = [v30 count];
            v68 = NSString;
            if (v67)
            {
              id v8 = v168;
              if (v170 != 1)
              {
                if (v166) {
                  v93 = @"every %ld years on the %@ %@ %@";
                }
                else {
                  v93 = @"every n years on a specific day of months";
                }
                v111 = [v180 localizedStringForKey:v93 value:&stru_1EE0C39E0 table:0];
                v113 = [(id)objc_opt_class() _orDaysOfWeekString:v188];
                objc_msgSend(v68, "localizedStringWithFormat:", v111, v170, v66, v113, v56);
                goto LABEL_144;
              }
              if (v166) {
                v69 = @"every year on the %@ %@ %@";
              }
              else {
                v69 = @"Event will occur every year on the %@ %@ %@.";
              }
              v111 = [v180 localizedStringForKey:v69 value:&stru_1EE0C39E0 table:0];
              uint64_t v112 = [(id)objc_opt_class() _orDaysOfWeekString:v188];
              v113 = (void *)v112;
              v162 = v56;
            }
            else
            {
              id v8 = v168;
              if (v170 != 1)
              {
                if (v166) {
                  v109 = @"every n years on a specific day of the year concise";
                }
                else {
                  v109 = @"every n years on a specific day of the year";
                }
                v111 = [v180 localizedStringForKey:v109 value:&stru_1EE0C39E0 table:0];
                v113 = [(id)objc_opt_class() _orDaysOfWeekString:v188];
                objc_msgSend(v68, "localizedStringWithFormat:", v111, v170, v66, v113, v163);
                goto LABEL_144;
              }
              if (v166)
              {
                v90 = @"every year on a specific day of the year concise";
                v91 = @"every year on the %@ %@";
              }
              else
              {
                v90 = @"every year on a specific day of the year";
                v91 = @"Event will occur every year on the %@ %@.";
              }
              v111 = [v180 localizedStringForKey:v90 value:v91 table:0];
              uint64_t v112 = [(id)objc_opt_class() _orDaysOfWeekString:v188];
              v113 = (void *)v112;
            }
            objc_msgSend(v68, "localizedStringWithFormat:", v111, v66, v112, v162, v163);
            v73 = LABEL_144:;

            id v7 = v164;
LABEL_247:

            v74 = v180;
LABEL_248:

            goto LABEL_254;
          }
          v75 = [v188 objectAtIndex:0];
          v76 = [v75 number];
          uint64_t v77 = [v76 integerValue];

          if (v77)
          {
            uint64_t v78 = [v30 count];
            v79 = NSString;
            id v7 = v164;
            id v8 = v168;
            if (v78)
            {
              if (v170 != 1)
              {
                if (v166) {
                  v119 = @"every %ld years on the %@ %@";
                }
                else {
                  v119 = @"Event will occur every %ld years on the %@ %@.";
                }
                v66 = [v180 localizedStringForKey:v119 value:&stru_1EE0C39E0 table:0];
                v144 = [(id)objc_opt_class() _andDaysOfWeekString:v188];
                objc_msgSend(v79, "localizedStringWithFormat:", v66, v170, v144, v56);
                goto LABEL_246;
              }
              if (v166) {
                v80 = @"every year on the %@ %@";
              }
              else {
                v80 = @"Event will occur every year on the %@ %@.";
              }
              v66 = [v180 localizedStringForKey:v80 value:&stru_1EE0C39E0 table:0];
              uint64_t v143 = [(id)objc_opt_class() _andDaysOfWeekString:v188];
              v144 = (void *)v143;
              v161 = v56;
              goto LABEL_242;
            }
            if (v170 == 1)
            {
              if (v166) {
                v114 = @"every year on the %@";
              }
              else {
                v114 = @"Event will occur every year on the %@.";
              }
              v152 = v180;
LABEL_241:
              v66 = [v152 localizedStringForKey:v114 value:&stru_1EE0C39E0 table:0];
              uint64_t v143 = [(id)objc_opt_class() _andDaysOfWeekString:v188];
              v144 = (void *)v143;
LABEL_242:
              objc_msgSend(v79, "localizedStringWithFormat:", v66, v143, v161, v162);
              v73 = LABEL_246:;

              goto LABEL_247;
            }
            if (v166) {
              v139 = @"every %ld years on the %@";
            }
            else {
              v139 = @"Event will occur every %ld years on the %@.";
            }
            v153 = v180;
            goto LABEL_245;
          }
          id v7 = v164;
          id v8 = v168;
          if ([v188 count])
          {
            uint64_t v94 = [v30 count];
            v79 = NSString;
            if (v94)
            {
              if (v170 != 1)
              {
                if (v166) {
                  v149 = @"every %ld years on every %@ in %@";
                }
                else {
                  v149 = @"Event will occur every %ld years on every %@ in %@.";
                }
                v66 = [v180 localizedStringForKey:v149 value:&stru_1EE0C39E0 table:0];
                v144 = [(id)objc_opt_class() _andDaysOfWeekString:v188];
                objc_msgSend(v79, "localizedStringWithFormat:", v66, v170, v144, v191);
                goto LABEL_246;
              }
              if (v166) {
                v95 = @"every year on every %@ in %@";
              }
              else {
                v95 = @"Event will occur every year on every %@ in %@.";
              }
              v66 = [v180 localizedStringForKey:v95 value:&stru_1EE0C39E0 table:0];
              uint64_t v143 = [(id)objc_opt_class() _andDaysOfWeekString:v188];
              v144 = (void *)v143;
              v161 = v191;
              goto LABEL_242;
            }
            if (v170 == 1)
            {
              if (v166) {
                v114 = @"every year on every %@";
              }
              else {
                v114 = @"Event will occur every year on every %@.";
              }
              v152 = v180;
              goto LABEL_241;
            }
            if (v166) {
              v139 = @"every %ld years on every %@";
            }
            else {
              v139 = @"Event will occur every %ld years on every %@.";
            }
            v153 = v180;
LABEL_245:
            v66 = [v153 localizedStringForKey:v139 value:&stru_1EE0C39E0 table:0];
            v144 = [(id)objc_opt_class() _andDaysOfWeekString:v188];
            objc_msgSend(v79, "localizedStringWithFormat:", v66, v170, v144, v162);
            goto LABEL_246;
          }
          if (v170 == 1)
          {
            if (v166)
            {
              v66 = [v180 localizedStringForKey:@"every year in %@" value:&stru_1EE0C39E0 table:0];
              objc_msgSend(NSString, "localizedStringWithFormat:", v66, v191, v161);
              v73 = LABEL_236:;
              goto LABEL_247;
            }
            v150 = NSString;
            v66 = [v180 localizedStringForKey:@"Event will occur every year in %@." value:&stru_1EE0C39E0 table:0];
            v156 = v191;
          }
          else
          {
            v150 = NSString;
            if (v166) {
              v151 = @"every %ld years in %@";
            }
            else {
              v151 = @"Event will occur every %ld years in %@.";
            }
            v66 = [v180 localizedStringForKey:v151 value:&stru_1EE0C39E0 table:0];
            v161 = v191;
            v156 = (void *)v170;
          }
          objc_msgSend(v150, "localizedStringWithFormat:", v66, v156, v161);
          goto LABEL_236;
        }
LABEL_79:
        v73 = 0;
LABEL_80:
        v74 = v180;
        goto LABEL_254;
      }
      if (![v188 count])
      {
        v96 = [v181 bymonthday];
        uint64_t v97 = [v96 count];
        v192 = v96;
        if (!v96) {
          goto LABEL_111;
        }
        unint64_t v98 = v97;
        if (v97 != 1) {
          goto LABEL_147;
        }
        v99 = [v96 objectAtIndex:0];
        uint64_t v100 = [v99 integerValue];
        v96 = v7;
        uint64_t v101 = [v179 day];

        BOOL v102 = v100 == v101;
        id v7 = v96;
        if (v102)
        {
LABEL_111:
          v103 = NSString;
          if (v170 == 1)
          {
            v74 = v180;
            if (v5) {
              v104 = @"monthly";
            }
            else {
              v104 = @"Event will occur every month.";
            }
            v154 = [v180 localizedStringForKey:v104 value:&stru_1EE0C39E0 table:0];
          }
          else
          {
            v74 = v180;
            if (v5) {
              v145 = @"every %ld months";
            }
            else {
              v145 = @"Event will occur every %ld months.";
            }
            v154 = [v180 localizedStringForKey:v145 value:&stru_1EE0C39E0 table:0];
            uint64_t v159 = v170;
          }
          v73 = objc_msgSend(v103, "localizedStringWithFormat:", v154, v159);
        }
        else
        {
LABEL_147:
          BOOL v167 = v5;
          id v165 = v7;
          v190 = [MEMORY[0x1E4F28E78] string];
          if (v98)
          {
            unint64_t v123 = 0;
            unint64_t v187 = v98;
            id v169 = v8;
            do
            {
              if (v123)
              {
                unint64_t v124 = v123 + 1;
                v125 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                v126 = v125;
                if (v123 + 1 >= v98)
                {
                  if (v98 == 2)
                  {
                    uint64_t v127 = [v125 localizedStringForKey:@" and %@" value:&stru_1EE0C39E0 table:0];
                    int v129 = 0;
                    int v128 = 1;
                    v130 = v96;
                    v131 = (void *)v5;
                    v184 = (void *)v127;
                    v185 = v126;
                  }
                  else
                  {
                    uint64_t v127 = [v125 localizedStringForKey:@"Recurrence rule last item format.  The last part of a list: X, Y and Z. Here %@ is 'Z'", @", and %@", 0 value table];
                    int v128 = 0;
                    int v129 = 1;
                    v130 = v96;
                    v131 = (void *)v5;
                    v177 = (void *)v127;
                    v178 = v126;
                  }
                }
                else
                {
                  uint64_t v127 = [v125 localizedStringForKey:@", %@", &stru_1EE0C39E0, 0 value table];
                  int v128 = 0;
                  int v129 = 0;
                  v130 = v126;
                  v131 = (void *)v127;
                }
                v133 = objc_opt_class();
                v134 = [v192 objectAtIndex:v123];
                v135 = objc_msgSend(v133, "_dayOfMonthAsString:", objc_msgSend(v134, "integerValue"));
                objc_msgSend(v190, "appendFormat:", v127, v135);

                if (v129)
                {
                }
                id v8 = v169;
                if (v128)
                {
                }
                v96 = v130;
                BOOL v5 = (BOOL)v131;
                unint64_t v98 = v187;
                if (v124 >= v187) {
                  goto LABEL_162;
                }
              }
              else
              {
                v132 = objc_opt_class();
                v130 = [v192 objectAtIndex:0];
                v131 = objc_msgSend(v132, "_dayOfMonthAsString:", objc_msgSend(v130, "integerValue"));
                [v190 appendString:v131];
                unint64_t v124 = 1;
              }

              v130 = v96;
              v131 = (void *)v5;
LABEL_162:
              BOOL v5 = (BOOL)v131;
              v96 = v130;
              unint64_t v123 = v124;
            }
            while (v124 != v98);
          }
          v136 = NSString;
          if (v170 == 1)
          {
            if (v167) {
              v137 = @"every month on the %@";
            }
            else {
              v137 = @"Event will occur every month on the %@.";
            }
            v74 = v180;
            v155 = [v180 localizedStringForKey:v137 value:&stru_1EE0C39E0 table:0];
            v154 = v190;
            objc_msgSend(v136, "localizedStringWithFormat:", v155, v190, v161);
          }
          else
          {
            if (v167) {
              v148 = @"every %ld months on the %@";
            }
            else {
              v148 = @"Event will occur every %ld months on the %@.";
            }
            v74 = v180;
            v155 = [v180 localizedStringForKey:v148 value:&stru_1EE0C39E0 table:0];
            v154 = v190;
            objc_msgSend(v136, "localizedStringWithFormat:", v155, v170, v190);
          v73 = };

          id v7 = v165;
        }

        goto LABEL_254;
      }
      v81 = [v181 bysetpos];
      uint64_t v82 = [v81 count];

      if (v82)
      {
        v83 = objc_opt_class();
        v84 = [v181 bysetpos];
        v85 = [v84 objectAtIndex:0];
        v86 = objc_msgSend(v83, "_weekDayPositionAsString:", objc_msgSend(v85, "integerValue"));

        v87 = NSString;
        if (v170 == 1)
        {
          if (v5)
          {
            id v88 = v7;
            v89 = @"every month on the %@ %@";
          }
          else
          {
            id v88 = v7;
            v89 = @"Event will occur every month on the %@ %@.";
          }
          v146 = [v180 localizedStringForKey:v89 value:&stru_1EE0C39E0 table:0];
          v147 = [(id)objc_opt_class() _orDaysOfWeekString:v188];
          objc_msgSend(v87, "localizedStringWithFormat:", v146, v86, v147, v162);
        }
        else
        {
          if (v5)
          {
            id v88 = v7;
            v120 = @"every %ld months on the %@ %@";
          }
          else
          {
            id v88 = v7;
            v120 = @"Event will occur every %ld months on the %@ %@.";
          }
          v146 = [v180 localizedStringForKey:v120 value:&stru_1EE0C39E0 table:0];
          v147 = [(id)objc_opt_class() _orDaysOfWeekString:v188];
          objc_msgSend(v87, "localizedStringWithFormat:", v146, v170, v86, v147);
        v73 = };

        id v7 = v88;
        goto LABEL_80;
      }
      v115 = [v188 objectAtIndex:0];
      v116 = [v115 number];
      uint64_t v117 = [v116 integerValue];

      v71 = NSString;
      if (v117)
      {
        if (v170 == 1)
        {
          if (v5)
          {
            v72 = @"every month on the %@-XX01";
            v118 = @"every month on the %@";
          }
          else
          {
            v72 = @"Event will occur every month on the %@-XX01.";
            v118 = @"Event will occur every month on the %@.";
          }
LABEL_180:
          v141 = v180;
          v106 = [v180 localizedStringForKey:v72 value:v118 table:0];
          v142 = [(id)objc_opt_class() _andDaysOfWeekString:v188];
          v160 = v142;
          goto LABEL_252;
        }
        if (v5) {
          v92 = @"every %ld months on the %@-XX01";
        }
        else {
          v92 = @"Event will occur every %ld months on the %@-XX01.";
        }
      }
      else
      {
        if (v170 == 1)
        {
          if (v5) {
            v72 = @"every month on %@";
          }
          else {
            v72 = @"Event will occur every month on %@.";
          }
LABEL_179:
          v118 = &stru_1EE0C39E0;
          goto LABEL_180;
        }
        if (v5) {
          v92 = @"every %ld months on %@";
        }
        else {
          v92 = @"Event will occur every %ld months on %@.";
        }
      }
LABEL_251:
      v141 = v180;
      v106 = [v180 localizedStringForKey:v92 value:&stru_1EE0C39E0 table:0];
      v142 = [(id)objc_opt_class() _andDaysOfWeekString:v188];
      v160 = (void *)v170;
      v161 = v142;
LABEL_252:
      v157 = v71;
      v74 = v141;
      v73 = objc_msgSend(v157, "localizedStringWithFormat:", v106, v160, v161);

LABEL_253:
LABEL_254:

      return v73;
    case 7:
      goto LABEL_19;
    default:
      goto LABEL_79;
  }
}

+ (id)_andDaysOfWeekString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] string];
  uint64_t v5 = [v3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = 0;
    do
    {
      id v8 = [v3 objectAtIndex:v7];
      if (v7)
      {
        ++v7;
        v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v10 = v9;
        if (v7 >= v6)
        {
          if (v6 == 2)
          {
            uint64_t v11 = [v9 localizedStringForKey:@" and %@" value:&stru_1EE0C39E0 table:0];
            int v13 = 0;
            int v12 = 1;
            uint64_t v19 = v10;
            v20 = (void *)v11;
          }
          else
          {
            uint64_t v11 = [v9 localizedStringForKey:@"Recurrence rule last item format.  The last part of a list: X, Y and Z. Here %@ is 'Z'", @", and %@", 0 value table];
            int v12 = 0;
            int v13 = 1;
            v17 = v10;
            v18 = (void *)v11;
          }
        }
        else
        {
          uint64_t v11 = [v9 localizedStringForKey:@", %@", &stru_1EE0C39E0, 0 value table];
          int v12 = 0;
          int v13 = 0;
          uint64_t v21 = v10;
          v22 = (void *)v11;
        }
        v15 = [(id)objc_opt_class() _numberedWeekDayString:v8];
        objc_msgSend(v4, "appendFormat:", v11, v15);

        if (v13)
        {
        }
        if (v12)
        {
        }
        if (v7 >= v6) {
          goto LABEL_17;
        }

        uint64_t v14 = v21;
      }
      else
      {
        uint64_t v14 = [(id)objc_opt_class() _numberedWeekDayString:v8];
        [v4 appendString:v14];
        unint64_t v7 = 1;
      }

LABEL_17:
    }
    while (v7 != v6);
  }

  return v4;
}

+ (id)_numberedWeekDayString:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  uint64_t v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [v4 weekday];
  unint64_t v7 = [v4 number];

  id v8 = [(id)objc_opt_class() _daysOfWeek];
  v9 = [v8 objectAtIndex:v6];

  if (v7)
  {
    v10 = objc_msgSend((id)objc_opt_class(), "_weekDayPositionAsString:", objc_msgSend(v7, "integerValue"));
    uint64_t v11 = NSString;
    int v12 = [v5 localizedStringForKey:@"%@ %@" value:&stru_1EE0C39E0 table:0];
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v10, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = v9;
  }

  return v13;
}

+ (id)_daysOfWeek
{
  if (_daysOfWeek_onceToken != -1) {
    dispatch_once(&_daysOfWeek_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)_daysOfWeek_sDaysOfWeek;

  return v2;
}

void __52__CalRecurrenceRuleDescriptionGenerator__daysOfWeek__block_invoke()
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v0 = [v4 standaloneWeekdaySymbols];
  v1 = (void *)[v0 mutableCopy];

  if ([v1 count] == 7)
  {
    [v1 insertObject:&stru_1EE0C39E0 atIndex:0];
    uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithArray:v1];
  }
  else
  {
    NSLog(&cfstr_Nsdateformatte.isa);
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", &stru_1EE0C39E0, @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", 0);
  }
  id v3 = (void *)_daysOfWeek_sDaysOfWeek;
  _daysOfWeek_sDaysOfWeek = v2;
}

+ (id)_dayOfMonthAsString:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  uint64_t v6 = &stru_1EE0C39E0;
  switch(a3)
  {
    case -1:
      unint64_t v7 = @"last day";
      id v8 = &stru_1EE0C39E0;
      goto LABEL_34;
    case 1:
      unint64_t v7 = @"1st-XX01";
      id v8 = @"1st";
      goto LABEL_34;
    case 2:
      unint64_t v7 = @"2nd-XX01";
      id v8 = @"2nd";
      goto LABEL_34;
    case 3:
      unint64_t v7 = @"3rd-XX01";
      id v8 = @"3rd";
      goto LABEL_34;
    case 4:
      unint64_t v7 = @"4th-XX01";
      id v8 = @"4th";
      goto LABEL_34;
    case 5:
      unint64_t v7 = @"5th-XX01";
      id v8 = @"5th";
      goto LABEL_34;
    case 6:
      unint64_t v7 = @"6th-XX01";
      id v8 = @"6th";
      goto LABEL_34;
    case 7:
      unint64_t v7 = @"7th-XX01";
      id v8 = @"7th";
      goto LABEL_34;
    case 8:
      unint64_t v7 = @"8th-XX01";
      id v8 = @"8th";
      goto LABEL_34;
    case 9:
      unint64_t v7 = @"9th-XX01";
      id v8 = @"9th";
      goto LABEL_34;
    case 10:
      unint64_t v7 = @"10th-XX01";
      id v8 = @"10th";
      goto LABEL_34;
    case 11:
      unint64_t v7 = @"11th-XX01";
      id v8 = @"11th";
      goto LABEL_34;
    case 12:
      unint64_t v7 = @"12th-XX01";
      id v8 = @"12th";
      goto LABEL_34;
    case 13:
      unint64_t v7 = @"13th-XX01";
      id v8 = @"13th";
      goto LABEL_34;
    case 14:
      unint64_t v7 = @"14th-XX01";
      id v8 = @"14th";
      goto LABEL_34;
    case 15:
      unint64_t v7 = @"15th-XX01";
      id v8 = @"15th";
      goto LABEL_34;
    case 16:
      unint64_t v7 = @"16th-XX01";
      id v8 = @"16th";
      goto LABEL_34;
    case 17:
      unint64_t v7 = @"17th-XX01";
      id v8 = @"17th";
      goto LABEL_34;
    case 18:
      unint64_t v7 = @"18th-XX01";
      id v8 = @"18th";
      goto LABEL_34;
    case 19:
      unint64_t v7 = @"19th-XX01";
      id v8 = @"19th";
      goto LABEL_34;
    case 20:
      unint64_t v7 = @"20th-XX01";
      id v8 = @"20th";
      goto LABEL_34;
    case 21:
      unint64_t v7 = @"21st-XX01";
      id v8 = @"21st";
      goto LABEL_34;
    case 22:
      unint64_t v7 = @"22nd-XX01";
      id v8 = @"22nd";
      goto LABEL_34;
    case 23:
      unint64_t v7 = @"23rd-XX01";
      id v8 = @"23rd";
      goto LABEL_34;
    case 24:
      unint64_t v7 = @"24th-XX01";
      id v8 = @"24th";
      goto LABEL_34;
    case 25:
      unint64_t v7 = @"25th-XX01";
      id v8 = @"25th";
      goto LABEL_34;
    case 26:
      unint64_t v7 = @"26th-XX01";
      id v8 = @"26th";
      goto LABEL_34;
    case 27:
      unint64_t v7 = @"27th-XX01";
      id v8 = @"27th";
      goto LABEL_34;
    case 28:
      unint64_t v7 = @"28th-XX01";
      id v8 = @"28th";
      goto LABEL_34;
    case 29:
      unint64_t v7 = @"29th-XX01";
      id v8 = @"29th";
      goto LABEL_34;
    case 30:
      unint64_t v7 = @"30th-XX01";
      id v8 = @"30th";
      goto LABEL_34;
    case 31:
      unint64_t v7 = @"31st-XX01";
      id v8 = @"31st";
LABEL_34:
      uint64_t v6 = [v4 localizedStringForKey:v7 value:v8 table:@"RecurrenceRule"];
      break;
    default:
      break;
  }

  return v6;
}

+ (id)_weekDayPositionAsString:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  uint64_t v6 = &stru_1EE0C39E0;
  switch(a3)
  {
    case -2:
      unint64_t v7 = @"next to last";
      goto LABEL_4;
    case -1:
      unint64_t v7 = @"last";
LABEL_4:
      id v8 = &stru_1EE0C39E0;
      goto LABEL_58;
    case 1:
      unint64_t v7 = @"1st-XX02";
      id v8 = @"1st";
      goto LABEL_58;
    case 2:
      unint64_t v7 = @"2nd-XX02";
      id v8 = @"2nd";
      goto LABEL_58;
    case 3:
      unint64_t v7 = @"3rd-XX02";
      id v8 = @"3rd";
      goto LABEL_58;
    case 4:
      unint64_t v7 = @"4th-XX02";
      id v8 = @"4th";
      goto LABEL_58;
    case 5:
      unint64_t v7 = @"5th-XX02";
      id v8 = @"5th";
      goto LABEL_58;
    case 6:
      unint64_t v7 = @"6th-XX02";
      id v8 = @"6th";
      goto LABEL_58;
    case 7:
      unint64_t v7 = @"7th-XX02";
      id v8 = @"7th";
      goto LABEL_58;
    case 8:
      unint64_t v7 = @"8th-XX02";
      id v8 = @"8th";
      goto LABEL_58;
    case 9:
      unint64_t v7 = @"9th-XX02";
      id v8 = @"9th";
      goto LABEL_58;
    case 10:
      unint64_t v7 = @"10th-XX02";
      id v8 = @"10th";
      goto LABEL_58;
    case 11:
      unint64_t v7 = @"11th-XX02";
      id v8 = @"11th";
      goto LABEL_58;
    case 12:
      unint64_t v7 = @"12th-XX02";
      id v8 = @"12th";
      goto LABEL_58;
    case 13:
      unint64_t v7 = @"13th-XX02";
      id v8 = @"13th";
      goto LABEL_58;
    case 14:
      unint64_t v7 = @"14th-XX02";
      id v8 = @"14th";
      goto LABEL_58;
    case 15:
      unint64_t v7 = @"15th-XX02";
      id v8 = @"15th";
      goto LABEL_58;
    case 16:
      unint64_t v7 = @"16th-XX02";
      id v8 = @"16th";
      goto LABEL_58;
    case 17:
      unint64_t v7 = @"17th-XX02";
      id v8 = @"17th";
      goto LABEL_58;
    case 18:
      unint64_t v7 = @"18th-XX02";
      id v8 = @"18th";
      goto LABEL_58;
    case 19:
      unint64_t v7 = @"19th-XX02";
      id v8 = @"19th";
      goto LABEL_58;
    case 20:
      unint64_t v7 = @"20th-XX02";
      id v8 = @"20th";
      goto LABEL_58;
    case 21:
      unint64_t v7 = @"21st-XX02";
      id v8 = @"21st";
      goto LABEL_58;
    case 22:
      unint64_t v7 = @"22nd-XX02";
      id v8 = @"22nd";
      goto LABEL_58;
    case 23:
      unint64_t v7 = @"23rd-XX02";
      id v8 = @"23rd";
      goto LABEL_58;
    case 24:
      unint64_t v7 = @"24th-XX02";
      id v8 = @"24th";
      goto LABEL_58;
    case 25:
      unint64_t v7 = @"25th-XX02";
      id v8 = @"25th";
      goto LABEL_58;
    case 26:
      unint64_t v7 = @"26th-XX02";
      id v8 = @"26th";
      goto LABEL_58;
    case 27:
      unint64_t v7 = @"27th-XX02";
      id v8 = @"27th";
      goto LABEL_58;
    case 28:
      unint64_t v7 = @"28th-XX02";
      id v8 = @"28th";
      goto LABEL_58;
    case 29:
      unint64_t v7 = @"29th-XX02";
      id v8 = @"29th";
      goto LABEL_58;
    case 30:
      unint64_t v7 = @"30th-XX02";
      id v8 = @"30th";
      goto LABEL_58;
    case 31:
      unint64_t v7 = @"31st-XX02";
      id v8 = @"31st";
      goto LABEL_58;
    case 32:
      unint64_t v7 = @"32nd-XX02";
      id v8 = @"32nd";
      goto LABEL_58;
    case 33:
      unint64_t v7 = @"33rd-XX02";
      id v8 = @"33rd";
      goto LABEL_58;
    case 34:
      unint64_t v7 = @"34th-XX02";
      id v8 = @"34th";
      goto LABEL_58;
    case 35:
      unint64_t v7 = @"35th-XX02";
      id v8 = @"35th";
      goto LABEL_58;
    case 36:
      unint64_t v7 = @"36th-XX02";
      id v8 = @"36th";
      goto LABEL_58;
    case 37:
      unint64_t v7 = @"37th-XX02";
      id v8 = @"37th";
      goto LABEL_58;
    case 38:
      unint64_t v7 = @"38th-XX02";
      id v8 = @"38th";
      goto LABEL_58;
    case 39:
      unint64_t v7 = @"39th-XX02";
      id v8 = @"39th";
      goto LABEL_58;
    case 40:
      unint64_t v7 = @"40th-XX02";
      id v8 = @"40th";
      goto LABEL_58;
    case 41:
      unint64_t v7 = @"41st-XX02";
      id v8 = @"41st";
      goto LABEL_58;
    case 42:
      unint64_t v7 = @"42nd-XX02";
      id v8 = @"42nd";
      goto LABEL_58;
    case 43:
      unint64_t v7 = @"43rd-XX02";
      id v8 = @"43rd";
      goto LABEL_58;
    case 44:
      unint64_t v7 = @"44th-XX02";
      id v8 = @"44th";
      goto LABEL_58;
    case 45:
      unint64_t v7 = @"45th-XX02";
      id v8 = @"45th";
      goto LABEL_58;
    case 46:
      unint64_t v7 = @"46th-XX02";
      id v8 = @"46th";
      goto LABEL_58;
    case 47:
      unint64_t v7 = @"47th-XX02";
      id v8 = @"47th";
      goto LABEL_58;
    case 48:
      unint64_t v7 = @"48th-XX02";
      id v8 = @"48th";
      goto LABEL_58;
    case 49:
      unint64_t v7 = @"49th-XX02";
      id v8 = @"49th";
      goto LABEL_58;
    case 50:
      unint64_t v7 = @"50th-XX02";
      id v8 = @"50th";
      goto LABEL_58;
    case 51:
      unint64_t v7 = @"51st-XX02";
      id v8 = @"51st";
      goto LABEL_58;
    case 52:
      unint64_t v7 = @"52nd-XX02";
      id v8 = @"52nd";
      goto LABEL_58;
    case 53:
      unint64_t v7 = @"53rd-XX02";
      id v8 = @"53rd";
LABEL_58:
      uint64_t v6 = [v4 localizedStringForKey:v7 value:v8 table:@"RecurrenceRule"];
      break;
    default:
      break;
  }

  return v6;
}

+ (id)_orDaysOfWeekString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [(id)objc_opt_class() _customDayCombinationDescription:v3];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28E78] string];
    uint64_t v8 = [v3 count];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = v8 - 1;
      do
      {
        int v12 = [v3 objectAtIndex:v10];
        if (v10)
        {
          if (v11 == v10)
          {
            if (v9 == 2) {
              id v13 = @" or %@";
            }
            else {
              id v13 = @", or %@";
            }
            v15 = &stru_1EE0C39E0;
          }
          else
          {
            id v13 = @", %@-XX02";
            v15 = @", %@";
          }
          uint64_t v14 = [v4 localizedStringForKey:v13 value:v15 table:@"RecurrenceRule"];
          uint64_t v16 = [(id)objc_opt_class() _numberedWeekDayString:v12];
          objc_msgSend(v7, "appendFormat:", v14, v16);
        }
        else
        {
          uint64_t v14 = [(id)objc_opt_class() _numberedWeekDayString:v12];
          [v7 appendString:v14];
        }

        ++v10;
      }
      while (v9 != v10);
      uint64_t v6 = 0;
    }
  }

  return v7;
}

+ (id)_customDayCombinationDescription:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  uint64_t v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [(id)objc_opt_class() daysTypeForDayArray:v4];

  switch(v6)
  {
    case 3:
      id v7 = @"weekend day";
LABEL_7:
      uint64_t v8 = &stru_1EE0C39E0;
      uint64_t v10 = v5;
      uint64_t v9 = 0;
      goto LABEL_8;
    case 2:
      id v7 = @"weekday";
      goto LABEL_7;
    case 1:
      id v7 = @"day-XX02";
      uint64_t v8 = @"day";
      uint64_t v9 = @"RecurrenceRule";
      uint64_t v10 = v5;
LABEL_8:
      uint64_t v11 = [v10 localizedStringForKey:v7 value:v8 table:v9];
      goto LABEL_10;
  }
  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

+ (int64_t)daysTypeForDayArray:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4 != 2)
  {
    if (v4 == 7)
    {
      int64_t v5 = 1;
      unint64_t v17 = 1;
      while (1)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v18 = v3;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (!v19) {
          break;
        }
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
LABEL_25:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          if ([*(id *)(*((void *)&v28 + 1) + 8 * v22) weekday] == v17) {
            break;
          }
          if (v20 == ++v22)
          {
            uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (v20) {
              goto LABEL_25;
            }
            goto LABEL_35;
          }
        }

        BOOL v12 = v17++ >= 7;
        if (v12) {
          goto LABEL_37;
        }
      }
    }
    else
    {
      if (v4 != 5)
      {
LABEL_36:
        int64_t v5 = 0;
        goto LABEL_37;
      }
      int64_t v5 = 2;
      unint64_t v6 = 2;
      while (1)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v7 = v3;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (!v8) {
          break;
        }
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v25;
LABEL_7:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v24 + 1) + 8 * v11) weekday] == v6) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v9) {
              goto LABEL_7;
            }
            goto LABEL_35;
          }
        }

        BOOL v12 = v6++ >= 6;
        if (v12) {
          goto LABEL_37;
        }
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  id v13 = [v3 objectAtIndexedSubscript:0];
  uint64_t v14 = [v13 weekday];

  v15 = [v3 objectAtIndexedSubscript:1];
  uint64_t v16 = [v15 weekday];

  if ((v14 != 7 || v16 != 1) && (v14 != 1 || v16 != 7)) {
    goto LABEL_36;
  }
  int64_t v5 = 3;
LABEL_37:

  return v5;
}

@end