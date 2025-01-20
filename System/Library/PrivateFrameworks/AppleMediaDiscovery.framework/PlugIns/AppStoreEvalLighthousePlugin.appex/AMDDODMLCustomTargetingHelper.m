@interface AMDDODMLCustomTargetingHelper
- (AMDDODMLCustomTargetingHelper)init;
- (id)callAMDClient:(id)a3 error:(id *)a4;
- (id)getDictionaryValueDataType:(id)a3 error:(id *)a4;
- (id)getOperationsArray;
- (id)mainTargetingResolver:(id)a3 error:(id *)a4;
- (id)parseData:(id)a3 withArray:(id)a4 error:(id *)a5;
- (id)performOperation:(id)a3 onArray:(id)a4 error:(id *)a5;
- (id)postProc:(id)a3 withDirections:(id)a4 error:(id *)a5;
@end

@implementation AMDDODMLCustomTargetingHelper

- (AMDDODMLCustomTargetingHelper)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AMDDODMLCustomTargetingHelper;
  v6 = [(AMDDODMLCustomTargetingHelper *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)callAMDClient:(id)a3 error:(id *)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  id v28 = [location[0] objectAtIndex:0];
  id v27 = [location[0] objectAtIndex:1];
  id v26 = [location[0] objectAtIndex:2];
  if ([v26 isEqual:@"isnil"]) {
    objc_storeStrong(&v26, 0);
  }
  id v25 = objc_alloc_init((Class)AMDClient);

  id v4 = objc_alloc((Class)AMDClientRequestEvent);
  id v24 = [v4 initWithFeatureName:v28 withAccountDSID:0 andAccountStoreFrontId:0 inDomain:v27 withCustomDescriptor:0 andSchemaVersion:v26];
  id v23 = 0;
  for (int i = 0; i < 3; ++i)
  {
    id v5 = [v25 getFeature:v24];
    id v6 = v23;
    id v23 = v5;

    char v20 = 0;
    unsigned __int8 v15 = 0;
    if (v23)
    {
      id v21 = [v23 objectForKey:AMD_CLIENT_STATUS];
      char v20 = 1;
      unsigned __int8 v15 = [v21 isEqual:AMD_CLIENT_STATUS_OK];
    }
    if (v20) {

    }
    if (v15) {
      break;
    }
  }
  if (v23)
  {
    id v18 = [v23 objectForKey:AMD_CLIENT_STATUS];
    if ([v18 isEqual:AMD_CLIENT_STATUS_OK])
    {
      id v17 = [v23 objectForKey:AMD_CLIENT_DATA];
      if (v17)
      {
        id v31 = v17;
      }
      else
      {
        id v11 = objc_alloc((Class)NSError);
        id v12 = [v11 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:154 userInfo:0];
        id *v29 = v12;
        id v31 = 0;
      }
      int v19 = 1;
      objc_storeStrong(&v17, 0);
    }
    else
    {
      id v9 = objc_alloc((Class)NSError);
      id v10 = [v9 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:153 userInfo:0];
      id *v29 = v10;
      id v31 = 0;
      int v19 = 1;
    }
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v7 = objc_alloc((Class)NSError);
    id v8 = [v7 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:152 userInfo:0];
    id *v29 = v8;
    id v31 = 0;
    int v19 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  v13 = v31;

  return v13;
}

- (id)getOperationsArray
{
  v4[2] = self;
  v4[1] = (id)a2;
  v5[0] = CustomTargetingSum;
  v5[1] = CustomTargetingSumEmp;
  v5[2] = CustomTargetingConNum;
  v5[3] = CustomTargetingConStr;
  v5[4] = CustomTargetingMean;
  v5[5] = CustomTargetingMeanEmp;
  v5[6] = CustomTargetingLen;
  v5[7] = CustomTargetingFirst;
  v5[8] = CustomTargetingMax;
  v5[9] = CustomTargetingMaxEmp;
  v5[10] = CustomTargetingMin;
  v5[11] = CustomTargetingMinEmp;
  v4[0] = +[NSArray arrayWithObjects:v5 count:12];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (id)performOperation:(id)a3 onArray:(id)a4 error:(id *)a5
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v67 = 0;
  objc_storeStrong(&v67, a4);
  v66 = a5;
  if (([location[0] isEqual:CustomTargetingSum] & 1) != 0
    || ([location[0] isEqual:CustomTargetingSumEmp] & 1) != 0)
  {
    if ([v67 count])
    {
      double v64 = 0.0;
      for (unint64_t i = 0; i < (unint64_t)[v67 count]; ++i)
      {
        id v41 = [v67 objectAtIndex:i];
        [v41 doubleValue];
        double v64 = v64 + v6;
      }
      v69 = +[NSNumber numberWithDouble:v64];
      int v65 = 1;
    }
    else
    {
      if ([location[0] isEqual:CustomTargetingSum])
      {
        id v5 = objc_alloc((Class)NSError);
        id *v66 = [v5 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:155 userInfo:0];
        v69 = 0;
      }
      else
      {
        v69 = +[NSNumber numberWithInt:0];
      }
      int v65 = 1;
    }
  }
  else if ([location[0] containsString:CustomTargetingConNum])
  {
    id v62 = [location[0] componentsSeparatedByString:@"_"];
    if ([v62 count] == (id)2 || objc_msgSend(v62, "count") == (id)3)
    {
      double v61 = 0.00000001;
      if ([v62 count] == (id)3)
      {
        id v60 = [v62 objectAtIndex:2];
        unsigned int v59 = [v60 intValue];
        double v61 = (double)(1 / (int)(v59 ^ 0xA));
        objc_storeStrong(&v60, 0);
      }
      id v58 = [v62 objectAtIndex:1];
      for (unint64_t j = 0; ; ++j)
      {
        unint64_t v40 = j;
        if (v40 >= (unint64_t)[v67 count]) {
          break;
        }
        id v56 = [v67 objectAtIndex:j];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v55 = v56;
          [v55 doubleValue];
          double v39 = v10 - v61;
          [v58 doubleValue];
          if (v39 >= v11
            || (objc_msgSend(v55, "doubleValue", v39), double v38 = v12 + v61, objc_msgSend(v58, "doubleValue"), v38 <= v13))
          {
            int v65 = 0;
          }
          else
          {
            v69 = +[NSNumber numberWithInt:v38];
            int v65 = 1;
          }
          objc_storeStrong(&v55, 0);
          if (!v65) {
            int v65 = 0;
          }
        }
        else
        {
          id v8 = objc_alloc((Class)NSError);
          id v9 = [v8 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:157 userInfo:0];
          id *v66 = v9;
          v69 = 0;
          int v65 = 1;
        }
        objc_storeStrong(&v56, 0);
        if (v65) {
          goto LABEL_31;
        }
      }
      v69 = +[NSNumber numberWithInt:0];
      int v65 = 1;
LABEL_31:
      objc_storeStrong(&v58, 0);
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id *v66 = [v7 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:156 userInfo:0];
      v69 = 0;
      int v65 = 1;
    }
    objc_storeStrong(&v62, 0);
  }
  else if ([location[0] containsString:CustomTargetingConStr])
  {
    id v54 = [location[0] componentsSeparatedByString:@"_"];
    id v53 = [v54 objectAtIndex:1];
    for (unint64_t k = 0; ; ++k)
    {
      unint64_t v37 = k;
      if (v37 >= (unint64_t)[v67 count]) {
        break;
      }
      id v51 = [v67 objectAtIndex:k];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v50 = v51;
        if ([v50 isEqual:v53])
        {
          v69 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
          int v65 = 1;
        }
        else
        {
          int v65 = 0;
        }
        objc_storeStrong(&v50, 0);
        if (!v65) {
          int v65 = 0;
        }
      }
      else
      {
        id v14 = objc_alloc((Class)NSError);
        id v15 = [v14 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:158 userInfo:0];
        id *v66 = v15;
        v69 = 0;
        int v65 = 1;
      }
      objc_storeStrong(&v51, 0);
      if (v65) {
        goto LABEL_46;
      }
    }
    v69 = +[NSNumber numberWithInt:0];
    int v65 = 1;
LABEL_46:
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v54, 0);
  }
  else if (([location[0] isEqual:CustomTargetingMean] & 1) != 0 {
         || ([location[0] isEqual:CustomTargetingMeanEmp] & 1) != 0)
  }
  {
    if ([v67 count])
    {
      double v49 = 0.0;
      for (unint64_t m = 0; m < (unint64_t)[v67 count]; ++m)
      {
        id v36 = [v67 objectAtIndex:m];
        [v36 doubleValue];
        double v49 = v49 + v17;
      }
      v69 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v49 / (double)(unint64_t)[v67 count]);
      int v65 = 1;
    }
    else
    {
      if ([location[0] isEqual:CustomTargetingMean])
      {
        id v16 = objc_alloc((Class)NSError);
        id *v66 = [v16 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:159 userInfo:0];
        v69 = 0;
      }
      else
      {
        v69 = +[NSNumber numberWithInt:0];
      }
      int v65 = 1;
    }
  }
  else if ([location[0] isEqual:CustomTargetingLen])
  {
    v69 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v67 count]);
    int v65 = 1;
  }
  else if ([location[0] isEqual:CustomTargetingFirst])
  {
    if ([v67 count])
    {
      v69 = (NSNumber *)[v67 firstObject];
    }
    else
    {
      id v18 = objc_alloc((Class)NSError);
      id *v66 = [v18 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:180 userInfo:0];
      v69 = 0;
    }
    int v65 = 1;
  }
  else if (([location[0] isEqual:CustomTargetingMax] & 1) != 0 {
         || ([location[0] isEqual:CustomTargetingMaxEmp] & 1) != 0)
  }
  {
    if ([v67 count])
    {
      id v34 = [v67 firstObject];
      [v34 doubleValue];
      double v35 = v20;

      double v47 = v35;
      for (unint64_t n = 0; n < (unint64_t)[v67 count]; ++n)
      {
        id v32 = [v67 objectAtIndex:n];
        [v32 doubleValue];
        double v33 = v21;

        if (v33 > v47) {
          double v47 = v33;
        }
      }
      v69 = +[NSNumber numberWithDouble:v47];
      int v65 = 1;
    }
    else
    {
      if ([location[0] isEqual:CustomTargetingMax])
      {
        id v19 = objc_alloc((Class)NSError);
        id *v66 = [v19 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:160 userInfo:0];
        v69 = 0;
      }
      else
      {
        v69 = +[NSNumber numberWithInt:0];
      }
      int v65 = 1;
    }
  }
  else if (([location[0] isEqual:CustomTargetingMin] & 1) != 0 {
         || ([location[0] isEqual:CustomTargetingMinEmp] & 1) != 0)
  }
  {
    if ([v67 count])
    {
      id v30 = [v67 firstObject];
      [v30 doubleValue];
      double v31 = v23;

      double v45 = v31;
      for (iunint64_t i = 0; ii < (unint64_t)[v67 count]; ++ii)
      {
        id v28 = [v67 objectAtIndex:ii];
        [v28 doubleValue];
        double v29 = v24;

        if (v29 < v45) {
          double v45 = v29;
        }
      }
      v69 = +[NSNumber numberWithDouble:v45];
      int v65 = 1;
    }
    else
    {
      if ([location[0] isEqual:CustomTargetingMin])
      {
        id v22 = objc_alloc((Class)NSError);
        id *v66 = [v22 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:161 userInfo:0];
        v69 = 0;
      }
      else
      {
        v69 = +[NSNumber numberWithInt:0];
      }
      int v65 = 1;
    }
  }
  else
  {
    id v25 = objc_alloc((Class)NSError);
    id *v66 = [v25 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:162 userInfo:0];
    v69 = 0;
    int v65 = 1;
  }
  objc_storeStrong(&v67, 0);
  objc_storeStrong(location, 0);
  id v26 = v69;

  return v26;
}

- (id)getDictionaryValueDataType:(id)a3 error:(id *)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = a4;
  id v21 = 0;
  memset(__b, 0, sizeof(__b));
  obunint64_t j = location[0];
  id v16 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
  if (v16)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    id v13 = v16;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v12);
      id v18 = [location[0] objectForKey:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v21)
        {
          objc_storeStrong(&v21, IsAnArray);
LABEL_28:
          int v17 = 0;
          goto LABEL_29;
        }
        if ([v21 isEqual:IsAnArray]) {
          goto LABEL_28;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v21)
          {
            objc_storeStrong(&v21, IsANumber);
            goto LABEL_28;
          }
          if ([v21 isEqual:IsANumber]) {
            goto LABEL_28;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v21)
            {
              objc_storeStrong(&v21, IsAString);
              goto LABEL_28;
            }
            if ([v21 isEqual:IsAString]) {
              goto LABEL_28;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v6 = objc_alloc((Class)NSError);
              id v7 = [v6 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:164 userInfo:0];
              *id v22 = v7;
              id v24 = 0;
              int v17 = 1;
              goto LABEL_29;
            }
            if (!v21)
            {
              objc_storeStrong(&v21, IsADictionary);
              goto LABEL_28;
            }
            if ([v21 isEqual:IsADictionary]) {
              goto LABEL_28;
            }
          }
        }
      }
      id v4 = objc_alloc((Class)NSError);
      id v5 = [v4 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:163 userInfo:0];
      *id v22 = v5;
      id v24 = 0;
      int v17 = 1;
LABEL_29:
      objc_storeStrong(&v18, 0);
      if (v17) {
        goto LABEL_33;
      }
      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0;
        id v13 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }
  int v17 = 0;
LABEL_33:

  if (!v17) {
    id v24 = v21;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  id v8 = v24;

  return v8;
}

- (id)parseData:(id)a3 withArray:(id)a4 error:(id *)a5
{
  v79 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v77 = 0;
  objc_storeStrong(&v77, a4);
  v76 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v21 = objc_alloc((Class)NSError);
      id *v76 = [v21 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:108 userInfo:0];
      id v80 = 0;
      int v73 = 1;
      goto LABEL_105;
    }
    id v71 = location[0];
    id v70 = [(AMDDODMLCustomTargetingHelper *)v79 getDictionaryValueDataType:v71 error:v76];
    if (!v70)
    {
      id v80 = 0;
      int v73 = 1;
      goto LABEL_101;
    }
    if ([v70 isEqual:IsAnArray])
    {
      if ([v77 count] == (id)3)
      {
        id v69 = [v77 objectAtIndex:1];
        id v68 = [v77 objectAtIndex:2];
        id v67 = [v71 objectForKey:v69];
        if (v67)
        {
          id v66 = [(AMDDODMLCustomTargetingHelper *)v79 performOperation:v68 onArray:v67 error:v76];
          if (v66) {
            id v80 = v66;
          }
          else {
            id v80 = 0;
          }
          int v73 = 1;
          objc_storeStrong(&v66, 0);
        }
        else
        {
          id v7 = objc_alloc((Class)NSError);
          id *v76 = [v7 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:168 userInfo:0];
          id v80 = 0;
          int v73 = 1;
        }
        objc_storeStrong(&v67, 0);
        objc_storeStrong(&v68, 0);
        objc_storeStrong(&v69, 0);
        goto LABEL_101;
      }
      if ([v77 count] == (id)2)
      {
        id v65 = [v77 objectAtIndex:1];
        id v64 = [(AMDDODMLCustomTargetingHelper *)v79 getOperationsArray];
        if ([v64 containsObject:v65])
        {
          if ([v71 count] == (id)1)
          {
            memset(__b, 0, sizeof(__b));
            id v34 = v71;
            if ([v34 countByEnumeratingWithState:__b objects:v84 count:16])
            {
              uint64_t v63 = *(void *)__b[1];
              id v61 = [v71 objectForKey:v63];
              id v60 = [(AMDDODMLCustomTargetingHelper *)v79 performOperation:v65 onArray:v61 error:v76];
              if (v60) {
                id v80 = v60;
              }
              else {
                id v80 = 0;
              }
              int v73 = 1;
              objc_storeStrong(&v60, 0);
              objc_storeStrong(&v61, 0);
            }
            else
            {
              int v73 = 0;
            }

            if (!v73) {
              int v73 = 0;
            }
          }
          else
          {
            id v8 = objc_alloc((Class)NSError);
            id *v76 = [v8 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:169 userInfo:0];
            id v80 = 0;
            int v73 = 1;
          }
        }
        else
        {
          id v59 = [v77 objectAtIndex:1];
          id v58 = [v71 objectForKey:v59];
          id v57 = [v58 firstObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v80 = v57;
            int v73 = 1;
          }
          else
          {
            id v9 = objc_alloc((Class)NSError);
            id *v76 = [v9 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:170 userInfo:0];
            id v80 = 0;
            int v73 = 1;
          }
          objc_storeStrong(&v57, 0);
          objc_storeStrong(&v58, 0);
          objc_storeStrong(&v59, 0);
        }
        objc_storeStrong(&v64, 0);
        objc_storeStrong(&v65, 0);
        if (!v73) {
          goto LABEL_100;
        }
      }
      else
      {
        if ([v77 count] != (id)1)
        {
          id v13 = objc_alloc((Class)NSError);
          id *v76 = [v13 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:172 userInfo:0];
          id v80 = 0;
          int v73 = 1;
          goto LABEL_101;
        }
        if ([v71 count] != (id)1)
        {
          id v12 = objc_alloc((Class)NSError);
          id *v76 = [v12 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:169 userInfo:0];
          id v80 = 0;
          int v73 = 1;
          goto LABEL_101;
        }
        memset(v55, 0, sizeof(v55));
        id v33 = v71;
        if ([v33 countByEnumeratingWithState:v55 objects:v83 count:16])
        {
          uint64_t v56 = *(void *)v55[1];
          id v54 = [v71 objectForKey:v56];
          id v53 = [v54 firstObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v80 = v53;
            int v73 = 1;
          }
          else
          {
            id v10 = objc_alloc((Class)NSError);
            id v11 = [v10 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:171 userInfo:0];
            id *v76 = v11;
            id v80 = 0;
            int v73 = 1;
          }
          objc_storeStrong(&v53, 0);
          objc_storeStrong(&v54, 0);
        }
        else
        {
          int v73 = 0;
        }

        if (!v73) {
          goto LABEL_100;
        }
      }
    }
    else
    {
      if (([v70 isEqual:IsANumber] & 1) == 0
        && ([v70 isEqual:IsAString] & 1) == 0)
      {
        if ([v70 isEqual:IsADictionary])
        {
          id v19 = objc_alloc((Class)NSError);
          id *v76 = [v19 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:177 userInfo:0];
        }
        else
        {
          id v20 = objc_alloc((Class)NSError);
          id *v76 = [v20 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:178 userInfo:0];
        }
        id v80 = 0;
        int v73 = 1;
        goto LABEL_101;
      }
      if ([v77 count] == (id)3)
      {
        id v52 = [v77 objectAtIndex:1];
        id v51 = [v77 objectAtIndex:2];
        id v50 = objc_alloc_init((Class)NSMutableArray);
        id v49 = objc_alloc_init((Class)NSMutableArray);
        memset(v47, 0, sizeof(v47));
        id v31 = v71;
        id v32 = [v31 countByEnumeratingWithState:v47 objects:v82 count:16];
        if (v32)
        {
          uint64_t v28 = *(void *)v47[2];
          uint64_t v29 = 0;
          id v30 = v32;
          while (1)
          {
            uint64_t v27 = v29;
            if (*(void *)v47[2] != v28) {
              objc_enumerationMutation(v31);
            }
            uint64_t v48 = *(void *)(v47[1] + 8 * v29);
            id v46 = [v71 objectForKey:v48];
            [v50 addObject:v48];
            [v49 addObject:v46];
            objc_storeStrong(&v46, 0);
            ++v29;
            if (v27 + 1 >= (unint64_t)v30)
            {
              uint64_t v29 = 0;
              id v30 = [v31 countByEnumeratingWithState:v47 objects:v82 count:16];
              if (!v30) {
                break;
              }
            }
          }
        }

        if ([v52 isEqual:@"GETKEYS"])
        {
          id v45 = [(AMDDODMLCustomTargetingHelper *)v79 performOperation:v51 onArray:v50 error:v76];
          if (v45) {
            id v80 = v45;
          }
          else {
            id v80 = 0;
          }
          int v73 = 1;
          objc_storeStrong(&v45, 0);
        }
        else if ([v52 isEqual:@"GETVALS"])
        {
          id v44 = [(AMDDODMLCustomTargetingHelper *)v79 performOperation:v51 onArray:v49 error:v76];
          if (v44) {
            id v80 = v44;
          }
          else {
            id v80 = 0;
          }
          int v73 = 1;
          objc_storeStrong(&v44, 0);
        }
        else
        {
          id v14 = objc_alloc((Class)NSError);
          id v15 = [v14 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:173 userInfo:0];
          id *v76 = v15;
          id v80 = 0;
          int v73 = 1;
        }
        objc_storeStrong(&v49, 0);
        objc_storeStrong(&v50, 0);
        objc_storeStrong(&v51, 0);
        objc_storeStrong(&v52, 0);
      }
      else
      {
        if ([v77 count] == (id)2)
        {
          id v43 = [v77 objectAtIndex:1];
          id v42 = [v71 objectForKey:v43];
          if (v42)
          {
            id v80 = v42;
          }
          else
          {
            id v16 = objc_alloc((Class)NSError);
            id *v76 = [v16 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:174 userInfo:0];
            id v80 = 0;
          }
          int v73 = 1;
          objc_storeStrong(&v42, 0);
          objc_storeStrong(&v43, 0);
          goto LABEL_101;
        }
        if ([v77 count] != (id)1)
        {
          id v18 = objc_alloc((Class)NSError);
          id *v76 = [v18 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:176 userInfo:0];
          id v80 = 0;
          int v73 = 1;
          goto LABEL_101;
        }
        if ([v71 count] != (id)1)
        {
          id v17 = objc_alloc((Class)NSError);
          id *v76 = [v17 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:175 userInfo:0];
          id v80 = 0;
          int v73 = 1;
          goto LABEL_101;
        }
        memset(v40, 0, sizeof(v40));
        id v26 = v71;
        if ([v26 countByEnumeratingWithState:v40 objects:v81 count:16])
        {
          uint64_t v41 = *(void *)v40[1];
          id v39 = [v71 objectForKey:v41];
          id v80 = v39;
          int v73 = 1;
          objc_storeStrong(&v39, 0);
        }
        else
        {
          int v73 = 0;
        }

        if (!v73) {
LABEL_100:
        }
          int v73 = 0;
      }
    }
LABEL_101:
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
    if (v73) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  id v75 = location[0];
  if ([v77 count] == (id)2)
  {
    double v35 = v79;
    id v36 = [v77 objectAtIndex:1];
    id v74 = -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:](v35, "performOperation:onArray:error:");

    if (v74)
    {
      int v73 = 0;
    }
    else
    {
      id v80 = 0;
      int v73 = 1;
    }
    objc_storeStrong(&v74, 0);
    if (!v73) {
      int v73 = 0;
    }
  }
  else if ([v77 count] == (id)1)
  {
    id v72 = [v75 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v80 = v72;
      int v73 = 1;
    }
    else
    {
      id v5 = objc_alloc((Class)NSError);
      id *v76 = [v5 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:166 userInfo:0];
      id v80 = 0;
      int v73 = 1;
    }
    objc_storeStrong(&v72, 0);
  }
  else
  {
    id v6 = objc_alloc((Class)NSError);
    id *v76 = [v6 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:167 userInfo:0];
    id v80 = 0;
    int v73 = 1;
  }
  objc_storeStrong(&v75, 0);
  if (!v73)
  {
LABEL_104:
    id v22 = objc_alloc((Class)NSError);
    id v23 = [v22 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:179 userInfo:0];
    id *v76 = v23;
    id v80 = 0;
    int v73 = 1;
  }
LABEL_105:
  objc_storeStrong(&v77, 0);
  objc_storeStrong(location, 0);
  id v24 = v80;

  return v24;
}

- (id)postProc:(id)a3 withDirections:(id)a4 error:(id *)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = a5;
  id v18 = [v20 componentsSeparatedByString:@"_"];
  id v17 = [v18 firstObject];
  if ([v17 isEqual:CustomTargetingCutDown])
  {
    id v16 = [v18 lastObject];
    id v15 = objc_alloc_init((Class)NSNumberFormatter);
    id v14 = [v15 numberFromString:v16];
    if (location[0] <= v14) {
      id v22 = location[0];
    }
    else {
      id v22 = v14;
    }
    int v13 = 1;
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  else if ([v17 isEqual:CustomTargetingCutUp])
  {
    id v12 = [v18 lastObject];
    id v11 = objc_alloc_init((Class)NSNumberFormatter);
    id v10 = [v11 numberFromString:v12];
    if (location[0] >= v10) {
      id v22 = location[0];
    }
    else {
      id v22 = v10;
    }
    int v13 = 1;
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    *id v19 = [v5 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:181 userInfo:0];
    id v22 = 0;
    int v13 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  id v6 = v22;

  return v6;
}

- (id)mainTargetingResolver:(id)a3 error:(id *)a4
{
  unint64_t v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v38 = a4;
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  obunint64_t j = location[0];
  id v23 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
  if (v23)
  {
    uint64_t v18 = *(void *)__b[2];
    uint64_t v19 = 0;
    id v20 = v23;
    while (1)
    {
      uint64_t v17 = v19;
      if (*(void *)__b[2] != v18) {
        objc_enumerationMutation(obj);
      }
      id v36 = *(id *)(__b[1] + 8 * v19);
      id v34 = [v36 componentsSeparatedByString:@"______"];
      id v33 = [v34 firstObject];
      id v32 = [v33 componentsSeparatedByString:@"____"];
      id v31 = [v32 firstObject];
      id v30 = [v31 componentsSeparatedByString:@"__"];
      if ([v30 count] == (id)3) {
        break;
      }
      id v4 = objc_alloc((Class)NSError);
      id v5 = [v4 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:165 userInfo:0];
      *double v38 = v5;
      id v41 = 0;
      int v29 = 1;
LABEL_25:
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      if (v29) {
        goto LABEL_29;
      }
      ++v19;
      if (v17 + 1 >= (unint64_t)v20)
      {
        uint64_t v19 = 0;
        id v20 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
        if (!v20) {
          goto LABEL_28;
        }
      }
    }
    id v28 = [(AMDDODMLCustomTargetingHelper *)v40 callAMDClient:v30 error:v38];
    if (!v28)
    {
      id v41 = 0;
      int v29 = 1;
LABEL_24:
      objc_storeStrong(&v28, 0);
      goto LABEL_25;
    }
    id v27 = [(AMDDODMLCustomTargetingHelper *)v40 parseData:v28 withArray:v32 error:v38];
    if (!v27)
    {
      id v41 = 0;
      int v29 = 1;
LABEL_23:
      objc_storeStrong(&v27, 0);
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = v27;
      [v37 setObject:v26 forKey:v36];
      objc_storeStrong(&v26, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = objc_alloc((Class)NSError);
        id v9 = [v8 initWithDomain:AMDLighthouseODMLPluginErrorDomain code:165 userInfo:0];
        *double v38 = v9;
        id v41 = 0;
        int v29 = 1;
        goto LABEL_23;
      }
      id v25 = v27;
      id v24 = v25;
      if ([v34 count] == (id)2)
      {
        id v15 = v40;
        id v14 = v25;
        id v16 = [v34 lastObject];
        id v6 = -[AMDDODMLCustomTargetingHelper postProc:withDirections:error:](v15, "postProc:withDirections:error:", v14);
        id v7 = v24;
        id v24 = v6;
      }
      if (v24)
      {
        id v12 = v37;
        id v13 = [v24 stringValue];
        objc_msgSend(v12, "setObject:forKey:");

        int v29 = 0;
      }
      else
      {
        id v41 = 0;
        int v29 = 1;
      }
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
      if (v29) {
        goto LABEL_23;
      }
    }
    int v29 = 0;
    goto LABEL_23;
  }
LABEL_28:
  int v29 = 0;
LABEL_29:

  if (!v29)
  {
    id v41 = v37;
    int v29 = 1;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  id v10 = v41;

  return v10;
}

@end