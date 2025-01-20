@interface CHDiffusionModelE5MLExecutionContext
- (id)predictionFromFeatureProvider:(id)a3 error:(id *)a4;
@end

@implementation CHDiffusionModelE5MLExecutionContext

- (id)predictionFromFeatureProvider:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend_createInputSurfacesForFeatureProvider_(CHE5MLUtilities, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  v14 = objc_msgSend_functionDescriptor(self, v9, v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_newInputsForFunctionDescriptor_surfaces_error_(CHE5MLUtilities, v15, (uint64_t)v14, (uint64_t)v8, (uint64_t)a4, v16);

  v48 = (void *)v17;
  v21 = objc_msgSend_predictionFromInputObjects_error_(self, v18, v17, (uint64_t)a4, v19, v20);
  if (v21)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v22 = v8;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v49, (uint64_t)v53, 16, v24);
    if (v29)
    {
      uint64_t v30 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v22);
          }
          v32 = objc_msgSend_objectForKeyedSubscript_(v22, v25, *(void *)(*((void *)&v49 + 1) + 8 * i), v26, v27, v28);
          v38 = (const void *)objc_msgSend_pointerValue(v32, v33, v34, v35, v36, v37);

          CFRelease(v38);
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v49, (uint64_t)v53, 16, v28);
      }
      while (v29);
    }

    v44 = objc_msgSend_functionDescriptor(self, v39, v40, v41, v42, v43);
    v46 = objc_msgSend_featureProviderForE5RTOutputs_functionDescriptor_dataType_error_(CHE5MLUtilities, v45, (uint64_t)v21, (uint64_t)v44, 65568, (uint64_t)a4);
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

@end