@interface GEOClientRankingModelFeature
- (GEOClientRankingModelFeature)init;
- (GEOClientRankingModelFeature)initWithFeatureIdentifier:(id)a3 function:(id)a4;
- (GEOClientRankingModelFeature)initWithGEOPDClientRankingFeatureMetadata:(id)a3;
- (GEOClientRankingModelFeatureFunction)function;
- (GEOClientRankingModelFeatureIdentifier)featureIdentifier;
@end

@implementation GEOClientRankingModelFeature

- (GEOClientRankingModelFeature)init
{
  result = (GEOClientRankingModelFeature *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeature)initWithFeatureIdentifier:(id)a3 function:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOClientRankingModelFeature;
  v9 = [(GEOClientRankingModelFeature *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureIdentifier, a3);
    objc_storeStrong((id *)&v10->_function, a4);
  }

  return v10;
}

- (GEOClientRankingModelFeature)initWithGEOPDClientRankingFeatureMetadata:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || (~*((unsigned __int16 *)v4 + 42) & 3) != 0)
  {
LABEL_55:
    v6 = 0;
    goto LABEL_56;
  }
  v6 = 0;
  id v7 = 0;
  switch(-[GEOPDClientRankingFeatureMetadata featureType]((uint64_t)v4))
  {
    case 0u:
      goto LABEL_57;
    case 1u:
      uint64_t v8 = -[GEOPDClientRankingFeatureMetadata featureTypeSource](v5);
      uint64_t v9 = v8;
      if (!v8) {
        goto LABEL_54;
      }
      if ((*(unsigned char *)(v8 + 24) & 2) != 0)
      {
        if (!*(_DWORD *)(v8 + 20)) {
          goto LABEL_54;
        }
      }
      else if ((*(unsigned char *)(v8 + 24) & 1) == 0)
      {
        goto LABEL_54;
      }
      uint64_t v30 = *(unsigned char *)(v8 + 24) & 1;
      v31 = [GEOClientRankingModelFeatureSourceIdentifier alloc];
      if ((*(unsigned char *)(v9 + 24) & 2) != 0) {
        uint64_t v32 = *(unsigned int *)(v9 + 20);
      }
      else {
        uint64_t v32 = 0;
      }
      if ((*(unsigned char *)(v9 + 24) & 1) != 0 && (int v33 = *(_DWORD *)(v9 + 16) - 1, v33 < 6)) {
        uint64_t v34 = dword_18A6408E4[v33];
      }
      else {
        uint64_t v34 = 0;
      }
      uint64_t v35 = [(GEOClientRankingModelFeatureSourceIdentifier *)v31 initWithSuggestionType:v32 serverEntryType:v34 sourceType:v30];
      goto LABEL_34;
    case 2u:
      uint64_t v10 = -[GEOPDClientRankingFeatureMetadata featureTypeResult](v5);
      uint64_t v9 = v10;
      if (!v10 || (*(unsigned char *)(v10 + 20) & 1) == 0 || !*(_DWORD *)(v10 + 16)) {
        goto LABEL_54;
      }
      v11 = [GEOClientRankingModelFeatureTypeIdentifier alloc];
      if (*(unsigned char *)(v9 + 20)) {
        int v12 = *(_DWORD *)(v9 + 16);
      }
      else {
        int v12 = 0;
      }
      uint64_t v35 = [(GEOClientRankingModelFeatureTypeIdentifier *)v11 initWithFeatureType:featureTypeForGEOFeatureType(v12)];
LABEL_34:
      v6 = (GEOClientRankingModelFeatureCompositeIdentifier *)v35;
      goto LABEL_35;
    case 3u:
      uint64_t v13 = -[GEOPDClientRankingFeatureMetadata featureTypeComposite](v5);
      uint64_t v9 = v13;
      if (!v13) {
        goto LABEL_54;
      }
      id v14 = *(id *)(v13 + 16);
      uint64_t v15 = [v14 count];

      if (!v15) {
        goto LABEL_54;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v17 = -[GEOPDClientRankingFeatureTypeComposite variableExponentPairs]((id *)v9);
      v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

      memset(v60, 0, sizeof(v60));
      v19 = -[GEOPDClientRankingFeatureTypeComposite variableExponentPairs]((id *)v9);
      if ([v19 countByEnumeratingWithState:v60 objects:v61 count:16])
      {
        v20 = (id *)**((void **)&v60[0] + 1);
        v21 = -[GEOPDVariableExponentPair variable](**((id ***)&v60[0] + 1));
        int v22 = -[GEOPDClientRankingFeatureUnit functionType]((uint64_t)v21);

        if (v22 == 2)
        {
          -[GEOPDVariableExponentPair variable](v20);
          v52 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDClientRankingFeatureUnit functionTypeDiscrete](v52);
          v24 = (_DWORD *)objc_claimAutoreleasedReturnValue();

          v53 = [GEOClientRankingModelFeatureFunctionDiscrete alloc];
          if (v24)
          {
            LODWORD(v54) = v24[5];
            LODWORD(v55) = v24[7];
            LODWORD(v56) = v24[4];
            LODWORD(v57) = v24[6];
          }
          else
          {
            double v56 = 0.0;
            double v54 = 0.0;
            double v55 = 0.0;
            double v57 = 0.0;
          }
          uint64_t v29 = -[GEOClientRankingModelFeatureFunctionDiscrete initWithValueThresholdLow:weightLow:valueThresholdHigh:weightHigh:](v53, "initWithValueThresholdLow:weightLow:valueThresholdHigh:weightHigh:", v54, v55, v56, v57, *(void *)&v60[0]);
        }
        else
        {
          if (v22 != 1)
          {
LABEL_52:

LABEL_53:
LABEL_54:

            goto LABEL_55;
          }
          -[GEOPDVariableExponentPair variable](v20);
          v23 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDClientRankingFeatureUnit functionTypeLinear](v23);
          v24 = (_DWORD *)objc_claimAutoreleasedReturnValue();

          v25 = [GEOClientRankingModelFeatureFunctionLinear alloc];
          if (v24)
          {
            LODWORD(v26) = v24[6];
            LODWORD(v27) = v24[4];
            LODWORD(v28) = v24[5];
          }
          else
          {
            double v27 = 0.0;
            double v26 = 0.0;
            double v28 = 0.0;
          }
          uint64_t v29 = -[GEOClientRankingModelFeatureFunctionLinear initWithWeight:maxRelativeValue:meanValue:](v25, "initWithWeight:maxRelativeValue:meanValue:", v26, v27, v28, *(void *)&v60[0]);
        }
        v58 = (void *)v29;

        goto LABEL_52;
      }

      if (!objc_msgSend(v18, "count", *(void *)&v60[0])) {
        goto LABEL_53;
      }
      v36 = [GEOClientRankingModelFeatureCompositeIdentifier alloc];
      LODWORD(v37) = *(_DWORD *)(v9 + 24);
      v6 = [(GEOClientRankingModelFeatureCompositeIdentifier *)v36 initWithUnitExponentPairs:v18 featureWeight:v37];

LABEL_35:
LABEL_36:
      int v38 = -[GEOPDClientRankingFeatureMetadata functionType]((uint64_t)v5);
      id v7 = 0;
      if (v38)
      {
        if (v38 == 2)
        {
          uint64_t v46 = -[GEOPDClientRankingFeatureMetadata functionTypeDiscrete](v5);
          v40 = (_DWORD *)v46;
          if (v46 && (~*(unsigned __int8 *)(v46 + 32) & 0xF) == 0)
          {
            v47 = [GEOClientRankingModelFeatureFunctionDiscrete alloc];
            LODWORD(v48) = v40[5];
            LODWORD(v49) = v40[7];
            LODWORD(v50) = v40[4];
            LODWORD(v51) = v40[6];
            uint64_t v45 = [(GEOClientRankingModelFeatureFunctionDiscrete *)v47 initWithValueThresholdLow:v48 weightLow:v49 valueThresholdHigh:v50 weightHigh:v51];
            goto LABEL_45;
          }
        }
        else
        {
          if (v38 != 1)
          {
LABEL_46:
            self = [(GEOClientRankingModelFeature *)self initWithFeatureIdentifier:v6 function:v7];

            id v7 = self;
            goto LABEL_57;
          }
          uint64_t v39 = -[GEOPDClientRankingFeatureMetadata functionTypeLinear](v5);
          v40 = (_DWORD *)v39;
          if (v39 && (~*(unsigned __int8 *)(v39 + 28) & 7) == 0)
          {
            v41 = [GEOClientRankingModelFeatureFunctionLinear alloc];
            LODWORD(v42) = v40[6];
            LODWORD(v43) = v40[4];
            LODWORD(v44) = v40[5];
            uint64_t v45 = [(GEOClientRankingModelFeatureFunctionLinear *)v41 initWithWeight:v42 maxRelativeValue:v43 meanValue:v44];
LABEL_45:
            id v7 = (GEOClientRankingModelFeature *)v45;

            goto LABEL_46;
          }
        }

LABEL_56:
        id v7 = 0;
      }
LABEL_57:

      return v7;
    default:
      goto LABEL_36;
  }
}

- (GEOClientRankingModelFeatureIdentifier)featureIdentifier
{
  return self->_featureIdentifier;
}

- (GEOClientRankingModelFeatureFunction)function
{
  return self->_function;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_function, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end