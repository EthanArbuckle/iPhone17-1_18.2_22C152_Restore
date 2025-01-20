@interface PKAutoRefineQueryItem
- (double)boundsForTextResultsColumnAtIndex:(uint64_t)a1;
- (id)initWithQueryItem:(void *)a3 usingStrokeProvider:;
- (void)setRefinedTokenColumns:(id)a3;
@end

@implementation PKAutoRefineQueryItem

- (id)initWithQueryItem:(void *)a3 usingStrokeProvider:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v57 = a2;
  id v5 = a3;
  if (a1)
  {
    v67.receiver = a1;
    v67.super_class = (Class)PKAutoRefineQueryItem;
    id v6 = objc_msgSendSuper2(&v67, sel_init);
    if (v6)
    {
      v7 = [v57 textResult];
      uint64_t v8 = [v7 copy];
      v9 = (void *)*((void *)v6 + 2);
      *((void *)v6 + 2) = v8;

      v10 = [v57 strokeIdentifiers];
      uint64_t v11 = [v10 copy];
      v12 = (void *)*((void *)v6 + 4);
      *((void *)v6 + 4) = v11;

      v13 = [v57 locale];
      uint64_t v14 = [v13 copy];
      v15 = (void *)*((void *)v6 + 7);
      *((void *)v6 + 7) = v14;

      v16 = (void *)MEMORY[0x1E4F1CA48];
      v17 = [v57 strokeIdentifiers];
      v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v19 = *((id *)v6 + 4);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v64 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            if ([v5 isValidStrokeIdentifier:v23])
            {
              id v24 = v23;
              v25 = [v24 strokeUUID];
              [v18 addObject:v25];
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v75 count:16];
        }
        while (v20);
      }

      objc_storeStrong((id *)v6 + 5, v18);
      v26 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v53 = [*((id *)v6 + 2) topTranscription];
        uint64_t v54 = [*((id *)v6 + 4) count];
        uint64_t v55 = [*((id *)v6 + 2) tokenColumnCount];
        *(_DWORD *)buf = 138740483;
        uint64_t v70 = (uint64_t)v53;
        __int16 v71 = 2048;
        uint64_t v72 = v54;
        __int16 v73 = 2048;
        uint64_t v74 = v55;
        _os_log_debug_impl(&dword_1C44F8000, v26, OS_LOG_TYPE_DEBUG, "AutoRefine Creating PKAutoRefineQueryItem transcription _%{sensitive}@_, %ld strokes and %ld token columns", buf, 0x20u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*((id *)v6 + 2), "tokenColumnCount"));
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = 0;
      v28 = (double *)MEMORY[0x1E4F1DB20];
      *(void *)&long long v29 = 138412290;
      long long v56 = v29;
      while (v27 < objc_msgSend(*((id *)v6 + 2), "tokenColumnCount", v56))
      {
        v30 = (void *)*((void *)v6 + 4);
        v31 = objc_msgSend(*((id *)v6 + 2), "strokeIndexesForColumnsInRange:", v27, 1);
        v32 = [v30 objectsAtIndexes:v31];

        double x = *v28;
        double y = v28[1];
        double width = v28[2];
        double height = v28[3];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v37 = v32;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v60;
          while (2)
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v60 != v39) {
                objc_enumerationMutation(v37);
              }
              v41 = *(void **)(*((void *)&v59 + 1) + 8 * j);
              if (![v5 isValidStrokeIdentifier:v41])
              {
                v47 = os_log_create("com.apple.pencilkit", "AutoRefine");
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v56;
                  uint64_t v70 = (uint64_t)v41;
                  _os_log_debug_impl(&dword_1C44F8000, v47, OS_LOG_TYPE_DEBUG, "AutoRefine Unexpected issue while creating PKAutoRefineQueryItem, stroke with Identifier %@ not found in stroke provider.", buf, 0xCu);
                }

                double x = *v28;
                double y = v28[1];
                double width = v28[2];
                double height = v28[3];
                goto LABEL_28;
              }
              v42 = [v5 strokeForIdentifier:v41];
              [v42 bounds];
              v80.origin.double x = v43;
              v80.origin.double y = v44;
              v80.size.double width = v45;
              v80.size.double height = v46;
              v77.origin.double x = x;
              v77.origin.double y = y;
              v77.size.double width = width;
              v77.size.double height = height;
              CGRect v78 = CGRectUnion(v77, v80);
              double x = v78.origin.x;
              double y = v78.origin.y;
              double width = v78.size.width;
              double height = v78.size.height;
            }
            uint64_t v38 = [v37 countByEnumeratingWithState:&v59 objects:v68 count:16];
            if (v38) {
              continue;
            }
            break;
          }
        }
LABEL_28:

        v48 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          v79.origin.double x = x;
          v79.origin.double y = y;
          v79.size.double width = width;
          v79.size.double height = height;
          v50 = NSStringFromCGRect(v79);
          *(_DWORD *)buf = 134218242;
          uint64_t v70 = v27;
          __int16 v71 = 2112;
          uint64_t v72 = (uint64_t)v50;
          _os_log_debug_impl(&dword_1C44F8000, v48, OS_LOG_TYPE_DEBUG, "AutoRefine PKAutoRefineQueryItem bounds for token column %ld = %@", buf, 0x16u);
        }
        v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
        [obj addObject:v49];

        ++v27;
      }
      objc_storeStrong((id *)v6 + 1, obj);
      v51 = [v57 refinedTokenColumns];
      [v6 setRefinedTokenColumns:v51];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (double)boundsForTextResultsColumnAtIndex:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  v2 = [*(id *)(a1 + 8) objectAtIndexedSubscript:a2];
  [v2 CGRectValue];
  double v4 = v3;

  return v4;
}

- (void)setRefinedTokenColumns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_refinableStrokes, 0);
  objc_storeStrong((id *)&self->_strokesUUIDs, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_refinedTokenColumns, 0);
  objc_storeStrong((id *)&self->_textResult, 0);

  objc_storeStrong((id *)&self->_boundingBoxForTokenColumn, 0);
}

@end