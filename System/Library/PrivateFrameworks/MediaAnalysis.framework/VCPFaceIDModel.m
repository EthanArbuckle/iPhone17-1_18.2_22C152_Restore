@interface VCPFaceIDModel
+ (BOOL)addFaceObservations:(id)a3 forPersonIdentifier:(id)a4 toModel:(id)a5 error:(id *)a6;
+ (BOOL)persistModel:(id)a3 toPath:(id)a4 error:(id *)a5;
+ (BOOL)persistPetsModel:(id)a3 toPath:(id)a4 error:(id *)a5;
+ (float)petClassificationThreshold;
+ (id)_loadModelAtPath:(id)a3 error:(id *)a4;
+ (id)_loadPetsModelAtPath:(id)a3 error:(id *)a4;
+ (id)animalObservationFromAnimalprintData:(id)a3;
+ (id)classifyAnimalObservation:(id)a3 withModel:(id)a4 error:(id *)a5;
+ (id)classifyFaceObservation:(id)a3 withModel:(id)a4 error:(id *)a5;
+ (id)faceObservationFromFaceprintData:(id)a3;
+ (id)loadVIPModelAtPath:(id)a3 withVIPType:(unint64_t)a4 error:(id *)a5;
+ (id)newMutablePersonsModel;
+ (id)personVIPModelFileName;
+ (id)petVIPModelFileName;
@end

@implementation VCPFaceIDModel

+ (id)personVIPModelFileName
{
  return @"vnpersonsmodel.bin";
}

+ (id)petVIPModelFileName
{
  return @"vnpetsmodel.bin";
}

+ (id)faceObservationFromFaceprintData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v9 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F45800]) initWithState:v3 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F457F8]);
    [v6 setFaceTorsoprint:v4];
    v7 = [v4 faceprint];
    [v6 setFaceprint:v7];
LABEL_7:

    goto LABEL_8;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "QuickFaceID: Failed to create faceprint from data : %@", buf, 0xCu);
    }
    id v6 = 0;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

+ (id)animalObservationFromAnimalprintData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v11 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F456B8]) initWithState:v3 error:&v11];
  id v5 = v11;
  if (v4)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F456B0]);
    LODWORD(v7) = 1065336439;
    v8 = (void *)[v6 initWithAnimalprint:v4 confidence:v7];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "QuickFaceID: Failed to create animalprint from data : %@", buf, 0xCu);
      }
    }
    v8 = 0;
  }

  return v8;
}

+ (id)newMutablePersonsModel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F458C8]);
  [v2 setMaximumIdentities:1000];
  [v2 setMaximumTrainingFaceprintsPerIdentity:10];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F458B0]) initWithConfiguration:v2];

  return v3;
}

+ (float)petClassificationThreshold
{
  return 0.5;
}

+ (id)classifyFaceObservation:(id)a3 withModel:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [a4 predictPersonFromFaceObservation:a3 limit:1 canceller:0 error:a5];
  id v6 = v5;
  if (v5)
  {
    double v7 = [v5 firstObject];
    [v7 confidence];
    float v9 = v8;
    if (v8 > VCPPersonFaceVIPMatchingThreshold())
    {
      v10 = [v7 predictedPersonUniqueIdentifier];
      if ((int)MediaAnalysisLogLevel() < 7)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 134217984;
        double v14 = v9;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "QuickFaceID: Passing classify face confidence: %f", (uint8_t *)&v13, 0xCu);
      }
LABEL_13:

      goto LABEL_15;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 134217984;
        double v14 = v9;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "QuickFaceID: Failed passing classify face confidence: %f", (uint8_t *)&v13, 0xCu);
      }
      v10 = 0;
      goto LABEL_13;
    }
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    double v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "QuickFaceID: Failed to predict at all", (uint8_t *)&v13, 2u);
    }
    goto LABEL_14;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

+ (id)classifyAnimalObservation:(id)a3 withModel:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = [a4 entityPredictionsForObservation:a3 limit:1 canceller:0 error:a5];
  id v6 = v5;
  if (v5)
  {
    double v7 = [v5 firstObject];
    [v7 confidence];
    float v9 = v8;
    [(id)objc_opt_class() petClassificationThreshold];
    if (v9 > v10)
    {
      id v11 = [v7 entityUniqueIdentifier];
      if ((int)MediaAnalysisLogLevel() < 7)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 134217984;
        double v15 = v9;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: Passing classify pet confidence: %f", (uint8_t *)&v14, 0xCu);
      }
LABEL_13:

      goto LABEL_15;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 134217984;
        double v15 = v9;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: Failed passing classify pet confidence: %f", (uint8_t *)&v14, 0xCu);
      }
      id v11 = 0;
      goto LABEL_13;
    }
LABEL_14:
    id v11 = 0;
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    double v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet: Failed to predict pet at all", (uint8_t *)&v14, 2u);
    }
    goto LABEL_14;
  }
  id v11 = 0;
LABEL_16:

  return v11;
}

+ (id)_loadModelAtPath:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  id v6 = objc_opt_new();
  double v7 = [MEMORY[0x1E4F458C0] modelFromURL:v5 options:v6 error:a4];

  return v7;
}

+ (id)_loadPetsModelAtPath:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  id v6 = objc_alloc_init(MEMORY[0x1E4F457E8]);
  double v7 = [MEMORY[0x1E4F457D8] modelFromURL:v5 options:v6 error:a4];

  return v7;
}

+ (id)loadVIPModelAtPath:(id)a3 withVIPType:(unint64_t)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    if (a4 == 1)
    {
      uint64_t v9 = [a1 _loadPetsModelAtPath:v8 error:a5];
      goto LABEL_9;
    }
    if (!a4)
    {
      uint64_t v9 = [a1 _loadModelAtPath:v8 error:a5];
LABEL_9:
      uint64_t v12 = (void *)v9;
      goto LABEL_15;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      float v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = VCPMAVIPTypeDescription(a4);
        int v15 = 138412290;
        uint64_t v16 = v13;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Failed to load VIP %@ Model", (uint8_t *)&v15, 0xCu);
      }
LABEL_13:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    float v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = VCPMAVIPTypeDescription(a4);
      int v15 = 138412290;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "QuickFaceID %@ Model path is nil; skip loading",
        (uint8_t *)&v15,
        0xCu);
    }
    goto LABEL_13;
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

+ (BOOL)persistModel:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a4];
  id v9 = objc_alloc_init(MEMORY[0x1E4F458D8]);
  [v9 setReadOnly:1];
  LOBYTE(a5) = [v7 writeToURL:v8 options:v9 error:a5];

  return (char)a5;
}

+ (BOOL)persistPetsModel:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a4];
  id v9 = objc_alloc_init(MEMORY[0x1E4F457F0]);
  [v9 setReadOnly:1];
  LOBYTE(a5) = [v7 writeToURL:v8 options:v9 error:a5];

  return (char)a5;
}

+ (BOOL)addFaceObservations:(id)a3 forPersonIdentifier:(id)a4 toModel:(id)a5 error:(id *)a6
{
  return [a5 addFaceObservations:a3 toPersonWithUniqueIdentifier:a4 error:a6];
}

@end