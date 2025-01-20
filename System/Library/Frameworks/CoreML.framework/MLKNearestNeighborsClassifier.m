@interface MLKNearestNeighborsClassifier
+ (BOOL)supportsSecureCoding;
+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6;
+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (BOOL)continueWithUpdate;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MLKNearestNeighborsClassifier)initWithCoder:(id)a3;
- (MLKNearestNeighborsClassifier)initWithDescription:(id)a3 configuration:(id)a4 parameters:(id)a5 dataPoints:(void *)a6 labels:(id)a7 error:(id *)a8;
- (MLNearestNeighborsIndex)index;
- (MLParameterContainer)parameterContainer;
- (MLUpdateProgressHandlers)progressHandlers;
- (NSArray)labelsForDataPoints;
- (NSDictionary)updateParameters;
- (NSObject)defaultLabel;
- (NSOrderedSet)labelsSet;
- (NSString)nearestDistancesFeatureName;
- (NSString)nearestLabelsFeatureName;
- (OS_dispatch_queue)progressHandlersDispatchQueue;
- (id)inputMultiArray:(id)a3 error:(id *)a4;
- (id)packageOutputWithPredictedLabel:(id)a3 classProbabilities:(id)a4 nearestLabels:(id)a5 nearestDistances:(id)a6 nearestFeatureIndices:(id)a7;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (int64_t)indexType;
- (int64_t)labelType;
- (int64_t)weightingScheme;
- (unint64_t)numberOfDimensions;
- (vector<std::pair<unsigned)computeKClosestLabels:(std:(float>>> *__return_ptr)retstr :(MLKNearestNeighborsClassifier *)self allocator<std:(SEL)a3 :(id)a4 pair<unsigned)long;
- (void)cancelUpdate;
- (void)computeClassProbabilities:(id *)a3 from:(void *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)extractNearestNeighborLabels:(id *)a3 distances:(id *)a4 indices:(id *)a5 from:(vector<std:()float> :(std:(float>>> *)a6 :allocator<std::pair<unsigned)long pair<unsigned)long;
- (void)resumeUpdate;
- (void)resumeUpdateWithParameters:(id)a3;
- (void)setContinueWithUpdate:(BOOL)a3;
- (void)setDefaultLabel:(id)a3;
- (void)setIndex:(id)a3;
- (void)setIndexType:(int64_t)a3;
- (void)setLabelType:(int64_t)a3;
- (void)setLabelsForDataPoints:(id)a3;
- (void)setLabelsSet:(id)a3;
- (void)setNearestDistancesFeatureName:(id)a3;
- (void)setNearestLabelsFeatureName:(id)a3;
- (void)setNumberOfDimensions:(unint64_t)a3;
- (void)setParameterContainer:(id)a3;
- (void)setProgressHandlers:(id)a3;
- (void)setProgressHandlersDispatchQueue:(id)a3;
- (void)setUpdateParameters:(id)a3;
- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4;
- (void)setWeightingScheme:(int64_t)a3;
- (void)updateModelWithData:(id)a3;
@end

@implementation MLKNearestNeighborsClassifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearestDistancesFeatureName, 0);
  objc_storeStrong((id *)&self->_nearestLabelsFeatureName, 0);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
  objc_storeStrong((id *)&self->_labelsSet, 0);
  objc_storeStrong((id *)&self->_labelsForDataPoints, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_parameterContainer, 0);
  objc_storeStrong((id *)&self->_updateParameters, 0);
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, 0);

  objc_storeStrong((id *)&self->_progressHandlers, 0);
}

- (void)setNearestDistancesFeatureName:(id)a3
{
}

- (NSString)nearestDistancesFeatureName
{
  return self->_nearestDistancesFeatureName;
}

- (void)setNearestLabelsFeatureName:(id)a3
{
}

- (NSString)nearestLabelsFeatureName
{
  return self->_nearestLabelsFeatureName;
}

- (void)setWeightingScheme:(int64_t)a3
{
  self->_weightingScheme = a3;
}

- (int64_t)weightingScheme
{
  return self->_weightingScheme;
}

- (void)setDefaultLabel:(id)a3
{
}

- (NSObject)defaultLabel
{
  return self->_defaultLabel;
}

- (void)setLabelsSet:(id)a3
{
}

- (NSOrderedSet)labelsSet
{
  return self->_labelsSet;
}

- (void)setLabelsForDataPoints:(id)a3
{
}

- (NSArray)labelsForDataPoints
{
  return self->_labelsForDataPoints;
}

- (void)setLabelType:(int64_t)a3
{
  self->_labelType = a3;
}

- (int64_t)labelType
{
  return self->_labelType;
}

- (void)setIndex:(id)a3
{
}

- (MLNearestNeighborsIndex)index
{
  return self->_index;
}

- (void)setIndexType:(int64_t)a3
{
  self->_indexType = a3;
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (void)setNumberOfDimensions:(unint64_t)a3
{
  self->_numberOfDimensions = a3;
}

- (unint64_t)numberOfDimensions
{
  return self->_numberOfDimensions;
}

- (void)setParameterContainer:(id)a3
{
}

- (MLParameterContainer)parameterContainer
{
  return self->_parameterContainer;
}

- (void)setContinueWithUpdate:(BOOL)a3
{
  self->_continueWithUpdate = a3;
}

- (BOOL)continueWithUpdate
{
  return self->_continueWithUpdate;
}

- (void)setUpdateParameters:(id)a3
{
}

- (NSDictionary)updateParameters
{
  return self->_updateParameters;
}

- (void)setProgressHandlersDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)progressHandlersDispatchQueue
{
  return self->_progressHandlersDispatchQueue;
}

- (void)setProgressHandlers:(id)a3
{
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return self->_progressHandlers;
}

- (MLKNearestNeighborsClassifier)initWithCoder:(id)a3
{
  v37[14] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  v37[3] = objc_opt_class();
  v37[4] = objc_opt_class();
  v37[5] = objc_opt_class();
  v37[6] = objc_opt_class();
  v37[7] = objc_opt_class();
  v37[8] = objc_opt_class();
  v37[9] = objc_opt_class();
  v37[10] = objc_opt_class();
  v37[11] = objc_opt_class();
  v37[12] = objc_opt_class();
  v37[13] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:14];
  [v5 addObjectsFromArray:v6];

  v7 = [v4 allowedClasses];
  [v5 unionSet:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDescription"];
  v36.receiver = self;
  v36.super_class = (Class)MLKNearestNeighborsClassifier;
  v9 = [(MLModel *)&v36 initWithDescription:v8];
  v10 = v9;
  if (v9)
  {
    v9->_numberOfDimensions = [v4 decodeIntegerForKey:@"kNumDimensions"];
    id v35 = 0;
    uint64_t v11 = [v4 decodeTopLevelObjectOfClasses:v5 forKey:@"kLabelsForDataPoints" error:&v35];
    id v12 = v35;
    p_labelsForDataPoints = &v9->_labelsForDataPoints;
    v14 = (void *)*p_labelsForDataPoints;
    void *p_labelsForDataPoints = v11;

    uint64_t v15 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:*p_labelsForDataPoints];
    labelsSet = v10->_labelsSet;
    v10->_labelsSet = (NSOrderedSet *)v15;

    id v34 = v12;
    uint64_t v17 = [v4 decodeTopLevelObjectOfClasses:v5 forKey:@"kDefaultLabel" error:&v34];
    id v18 = v34;

    defaultLabel = v10->_defaultLabel;
    v10->_defaultLabel = v17;

    v10->_labelType = [v4 decodeIntegerForKey:@"kLabelType"];
    v10->_weightingScheme = [v4 decodeIntegerForKey:@"kWeightingScheme"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNearestLabelsFeatureName"];
    nearestLabelsFeatureName = v10->_nearestLabelsFeatureName;
    v10->_nearestLabelsFeatureName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNearestDistancesFeatureName"];
    nearestDistancesFeatureName = v10->_nearestDistancesFeatureName;
    v10->_nearestDistancesFeatureName = (NSString *)v22;

    uint64_t v24 = [v4 decodeIntegerForKey:@"kIndexType"];
    v10->_indexType = v24;
    if (v24 == 1)
    {
      id v32 = v18;
      uint64_t v25 = [v4 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"kIndex" error:&v32];
      id v26 = v32;
    }
    else
    {
      if (v24)
      {
        id v26 = v18;
        goto LABEL_9;
      }
      id v33 = v18;
      uint64_t v25 = [v4 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"kIndex" error:&v33];
      id v26 = v33;
    }
    index = v10->_index;
    v10->_index = (MLNearestNeighborsIndex *)v25;

LABEL_9:
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kParameterContainer"];
    parameterContainer = v10->_parameterContainer;
    v10->_parameterContainer = (MLParameterContainer *)v28;

    goto LABEL_10;
  }
  id v26 = 0;
LABEL_10:
  v30 = v10;

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(MLModel *)self modelDescription];
  [v11 encodeObject:v4 forKey:@"kDescription"];

  id v5 = [(MLKNearestNeighborsClassifier *)self labelsForDataPoints];
  [v11 encodeObject:v5 forKey:@"kLabelsForDataPoints"];

  v6 = [(MLKNearestNeighborsClassifier *)self defaultLabel];
  [v11 encodeObject:v6 forKey:@"kDefaultLabel"];

  objc_msgSend(v11, "encodeInteger:forKey:", -[MLKNearestNeighborsClassifier labelType](self, "labelType"), @"kLabelType");
  objc_msgSend(v11, "encodeInteger:forKey:", -[MLKNearestNeighborsClassifier weightingScheme](self, "weightingScheme"), @"kWeightingScheme");
  v7 = [(MLKNearestNeighborsClassifier *)self nearestLabelsFeatureName];
  [v11 encodeObject:v7 forKey:@"kNearestLabelsFeatureName"];

  v8 = [(MLKNearestNeighborsClassifier *)self nearestDistancesFeatureName];
  [v11 encodeObject:v8 forKey:@"kNearestDistancesFeatureName"];

  objc_msgSend(v11, "encodeInteger:forKey:", -[MLKNearestNeighborsClassifier numberOfDimensions](self, "numberOfDimensions"), @"kNumDimensions");
  objc_msgSend(v11, "encodeInteger:forKey:", -[MLKNearestNeighborsClassifier indexType](self, "indexType"), @"kIndexType");
  v9 = [(MLKNearestNeighborsClassifier *)self index];
  [v11 encodeObject:v9 forKey:@"kIndex"];

  v10 = [(MLKNearestNeighborsClassifier *)self parameterContainer];
  [v11 encodeObject:v10 forKey:@"kParameterContainer"];
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 hasGlobalScope]) {
    goto LABEL_3;
  }
  v7 = [(MLKNearestNeighborsClassifier *)self parameterContainer];
  v8 = [v7 currentParameterValues];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
LABEL_3:
    if (a4)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Nearest Neighbor Classifier Model does not have a parameter for requested key %@.", v6 format];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = NSString;
  id v9 = v6;
  v10 = objc_msgSend(v8, "stringWithUTF8String:", objc_msgSend(v9, "fileSystemRepresentation"));
  [v7 removeItemAtPath:v10 error:0];
  id v26 = 0;
  char v11 = [v7 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v12 = v26;
  if (v11)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 fileSystemRepresentation]);
    OArchive::OArchive((uint64_t)v23, (uint64_t)__p, 0);
    if (v22 < 0) {
      operator delete(__p[0]);
    }
    operator<<((uint64_t)v23, 404);
    id v20 = v12;
    v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v20];
    id v14 = v20;

    if (v13)
    {
      uint64_t v15 = +[MLArchivingUtils codedObjectURLFromOutputArchiver:v23];
      id v19 = v14;
      char v16 = [v13 writeToURL:v15 options:1 error:&v19];
      id v12 = v19;

      if (a4) {
        char v17 = v16;
      }
      else {
        char v17 = 1;
      }
      if ((v17 & 1) == 0)
      {
        *a4 = +[MLModelErrorUtils errorWithCode:6, v12, @"Failed save updated model to %@", v15 underlyingError format];
      }
    }
    else
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:6 underlyingError:v14 format:@"Failed archive updated model"];
        char v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v16 = 0;
      }
      id v12 = v14;
    }

    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v25);
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:6, v12, @"Failed to create directory at %@", v10 underlyingError format];
    char v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (void)resumeUpdateWithParameters:(id)a3
{
}

- (void)cancelUpdate
{
}

- (void)resumeUpdate
{
}

- (void)updateModelWithData:(id)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v4 = [(MLModel *)self modelDescription];
  id v5 = [v4 inputDescriptionsByName];
  id v6 = [v5 allKeys];
  v45 = [v6 objectAtIndexedSubscript:0];

  v7 = [(MLModel *)self modelDescription];
  v44 = [v7 predictedFeatureName];

  [(MLKNearestNeighborsClassifier *)self setContinueWithUpdate:1];
  __p = 0;
  v52 = 0;
  uint64_t v53 = 0;
  std::vector<float>::reserve(&__p, -[MLKNearestNeighborsClassifier numberOfDimensions](self, "numberOfDimensions") * [v47 count]);
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v9 = [(MLKNearestNeighborsClassifier *)self labelsForDataPoints];
  v48 = self;
  v43 = (void *)[v8 initWithArray:v9 copyItems:1];

  uint64_t v10 = 0;
  char v11 = 0;
  while (v10 < [v47 count])
  {
    id v12 = [v47 featuresAtIndex:v10];
    if (!v12)
    {
      id v32 = +[MLModelErrorUtils errorWithCode:6, @"Received nil MLFeatureProvider for index %d from training data MLBatchProvider", v10 format];

      id v46 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
      v41 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
      [v46 dispatchTrainingCompletionHandlerWithError:v32 onQueue:v41];
      goto LABEL_32;
    }
    id v46 = v12;
    v13 = [v12 featureValueForName:v45];
    id v14 = [v13 multiArrayValue];

    if (!v14)
    {
      id v32 = +[MLModelErrorUtils errorWithCode:6, @"Missing MLMultiArrayValue for feature named %@", v45 format];

      v41 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
      v42 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
      [v41 dispatchTrainingCompletionHandlerWithError:v32 onQueue:v42];
      goto LABEL_31;
    }
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLKNearestNeighborsClassifier numberOfDimensions](v48, "numberOfDimensions"));
    v55[0] = v15;
    char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];

    char v17 = [v14 shape];
    if ([v17 count] != 1)
    {

LABEL_12:
      v31 = [v14 shape];
      id v32 = +[MLModelErrorUtils errorWithCode:6, @"Shape of training data point %d MLMultiArray is %@, expected %@", v10, v31, v16 format];

      id v26 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
      id v27 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
      [(MLMultiArray *)v26 dispatchTrainingCompletionHandlerWithError:v32 onQueue:v27];
      int v33 = 1;
      goto LABEL_22;
    }
    id v18 = [v14 shape];
    id v19 = [v18 objectAtIndex:0];
    uint64_t v20 = [v19 unsignedIntegerValue];
    LOBYTE(v20) = v20 == [(MLKNearestNeighborsClassifier *)v48 numberOfDimensions];

    if ((v20 & 1) == 0) {
      goto LABEL_12;
    }
    uint64_t v21 = (v52 - (unsigned char *)__p) >> 2;
    std::vector<float>::resize((char **)&__p, v21 + [(MLKNearestNeighborsClassifier *)v48 numberOfDimensions]);
    char v22 = (char *)__p;
    v23 = [MLMultiArray alloc];
    uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLKNearestNeighborsClassifier numberOfDimensions](v48, "numberOfDimensions"));
    uint64_t v54 = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    id v26 = [(MLMultiArray *)v23 initWithDataPointer:&v22[4 * v21] shape:v25 dataType:65568 strides:&unk_1EF11A8C8 deallocator:0 error:0];

    id v50 = 0;
    LOBYTE(v24) = [v14 copyIntoMultiArray:v26 error:&v50];
    id v27 = v50;
    if ((v24 & 1) == 0)
    {
      id v32 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v27 format:@"Failed to convert training data to the right format"];

      v29 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
      v30 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
      [v29 dispatchTrainingCompletionHandlerWithError:v32 onQueue:v30];
LABEL_20:
      int v33 = 1;
      goto LABEL_21;
    }
    uint64_t v28 = [v46 featureValueForName:v44];
    v29 = v28;
    if (!v28)
    {
      id v32 = +[MLModelErrorUtils errorWithCode:6, @"Missing MLFeatureValue for feature named %@", v44 format];

      v30 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
      id v34 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
      [v30 dispatchTrainingCompletionHandlerWithError:v32 onQueue:v34];
LABEL_19:

      goto LABEL_20;
    }
    if ([v28 type] == 3)
    {
      v30 = [v29 stringValue];
      [v43 addObject:v30];
    }
    else
    {
      if ([v29 type] != 1)
      {
        id v32 = +[MLModelErrorUtils errorWithCode:6 format:@"Label type must be one of MLFeatureTypeString or MLFeatureTypeInt64"];

        v30 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
        id v34 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
        [v30 dispatchTrainingCompletionHandlerWithError:v32 onQueue:v34];
        goto LABEL_19;
      }
      v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v29, "int64Value"));
      [v43 addObject:v30];
    }
    int v33 = 0;
    id v32 = v11;
LABEL_21:

LABEL_22:
    if (v33) {
      goto LABEL_33;
    }
    ++v10;
    char v11 = v32;
  }
  id v35 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
  objc_super v36 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
  [v35 dispatchTrainingBeginProgressHandlerWithMetrics:MEMORY[0x1E4F1CC08] parameters:MEMORY[0x1E4F1CC08] onQueue:v36];

  if (![(MLKNearestNeighborsClassifier *)v48 continueWithUpdate])
  {
LABEL_27:
    id v46 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
    v41 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
    [v46 dispatchTrainingCompletionHandlerWithMetrics:MEMORY[0x1E4F1CC08] parameters:MEMORY[0x1E4F1CC08] onQueue:v41];
    id v32 = v11;
    goto LABEL_32;
  }
  [(MLKNearestNeighborsClassifier *)v48 setLabelsForDataPoints:v43];
  v37 = (void *)MEMORY[0x1E4F1CAA0];
  v38 = [(MLKNearestNeighborsClassifier *)v48 labelsForDataPoints];
  v39 = [v37 orderedSetWithArray:v38];
  [(MLKNearestNeighborsClassifier *)v48 setLabelsSet:v39];

  v40 = [(MLKNearestNeighborsClassifier *)v48 index];
  id v49 = 0;
  LODWORD(v39) = [v40 updateWithData:&__p error:&v49];
  id v46 = v49;

  if (v39)
  {

    goto LABEL_27;
  }
  id v32 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v46 format:@"Failed to update model with training data"];

  v41 = [(MLKNearestNeighborsClassifier *)v48 progressHandlers];
  v42 = [(MLKNearestNeighborsClassifier *)v48 progressHandlersDispatchQueue];
  [v41 dispatchTrainingCompletionHandlerWithError:v32 onQueue:v42];
LABEL_31:

LABEL_32:
LABEL_33:

  if (__p)
  {
    v52 = __p;
    operator delete(__p);
  }
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(MLKNearestNeighborsClassifier *)self setProgressHandlers:v7];
  [(MLKNearestNeighborsClassifier *)self setProgressHandlersDispatchQueue:v6];
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v8 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  id v9 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v51, v9, 2, -[MLModel signpostID](self, "signpostID"), [v8 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [v8 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__MLKNearestNeighborsClassifier_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  v13 = [(MLKNearestNeighborsClassifier *)self inputMultiArray:v38 error:a5];
  if (v13)
  {
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLKNearestNeighborsClassifier numberOfDimensions](self, "numberOfDimensions"));
    v55[0] = v14;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];

    uint64_t v15 = [v13 shape];
    if ([v15 count] == 1)
    {
      char v16 = [v13 shape];
      char v17 = [v16 objectAtIndex:0];
      uint64_t v18 = [v17 unsignedIntegerValue];
      LOBYTE(v18) = v18 == [(MLKNearestNeighborsClassifier *)self numberOfDimensions];

      if (v18)
      {
        id v19 = [(MLKNearestNeighborsClassifier *)self labelsForDataPoints];
        BOOL v20 = [v19 count] == 0;

        if (v20)
        {
          id v32 = [(MLKNearestNeighborsClassifier *)self defaultLabel];
          BOOL v33 = v32 == 0;

          if (v33)
          {
            if (a5)
            {
              +[MLModelErrorUtils genericErrorWithFormat:@"Error predicting class due to missing data points and default label."];
              v30 = 0;
              id v21 = 0;
              id v28 = 0;
              id v29 = 0;
              v31 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              a5 = 0;
            }
            else
            {
              v30 = 0;
              id v21 = 0;
              id v28 = 0;
              id v29 = 0;
              v31 = 0;
            }
            goto LABEL_25;
          }
          v30 = [(MLKNearestNeighborsClassifier *)self defaultLabel];
          id v34 = [(MLKNearestNeighborsClassifier *)self defaultLabel];
          uint64_t v53 = v34;
          uint64_t v54 = &unk_1EF119E70;
          id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];

          id v35 = [(MLKNearestNeighborsClassifier *)self defaultLabel];
          v52 = v35;
          id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];

          id v29 = &unk_1EF11A8B0;
          a5 = (id *)&unk_1EF11A898;
        }
        else
        {
          [(MLKNearestNeighborsClassifier *)self computeKClosestLabels:v13];
          *(_OWORD *)__p = v46;
          uint64_t v49 = v47;
          id v45 = 0;
          [(MLKNearestNeighborsClassifier *)self computeClassProbabilities:&v45 from:__p];
          id v21 = v45;
          id v43 = 0;
          id v44 = 0;
          v41 = 0;
          id v42 = 0;
          v39 = 0;
          v40 = 0;
          char v22 = (long long *)__p[0];
          v23 = (long long *)__p[1];
          int64_t v24 = (char *)__p[1] - (char *)__p[0];
          if (__p[1] != __p[0])
          {
            if (v24 < 0) {
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v25 = std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v24 >> 4);
            v39 = v25;
            v40 = v25;
            v41 = &v25[v26];
            do
            {
              long long v27 = *v22++;
              *v25++ = v27;
            }
            while (v22 != v23);
            v40 = v25;
          }
          [(MLKNearestNeighborsClassifier *)self extractNearestNeighborLabels:&v44 distances:&v43 indices:&v42 from:&v39];
          id v28 = v44;
          a5 = (id *)v43;
          id v29 = v42;
          if (v39)
          {
            v40 = v39;
            operator delete(v39);
          }
          v30 = [v21 classLabelOfMaxProbability];
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        v31 = [(MLKNearestNeighborsClassifier *)self packageOutputWithPredictedLabel:v30 classProbabilities:v21 nearestLabels:v28 nearestDistances:a5 nearestFeatureIndices:v29];
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    if (!a5)
    {
      v31 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v30 = [v13 shape];
    +[MLModelErrorUtils featureTypeErrorWithFormat:@"Shape of input MLMultiArray is %@, expected %@", v30, v37];
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  if (a5)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:@"Missing MLMultiArray for MLFeatureProvider"];
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
LABEL_28:

  v12[2](v12);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v51);

  return v31;
}

uint64_t __70__MLKNearestNeighborsClassifier_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (void)extractNearestNeighborLabels:(id *)a3 distances:(id *)a4 indices:(id *)a5 from:(vector<std:()float> :(std:(float>>> *)a6 :allocator<std::pair<unsigned)long pair<unsigned)long
{
  uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  id v28 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v12 = (void *)[v11 mutableCopy];
  v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  long long v27 = a5;
  var0 = a6->var0;
  var1 = a6->var1;
  char v16 = [(MLKNearestNeighborsClassifier *)self labelsForDataPoints];
  if (var1 != var0)
  {
    uint64_t v17 = 0;
    if ((unint64_t)((var1 - var0) >> 4) <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = (var1 - var0) >> 4;
    }
    do
    {
      id v19 = [v16 objectAtIndexedSubscript:*(void *)((char *)a6->var0 + v17)];
      [v28 addObject:v19];
      LODWORD(v20) = *(_DWORD *)((char *)a6->var0 + v17 + 8);
      id v21 = [NSNumber numberWithFloat:v20];
      [v12 addObject:v21];
      char v22 = [NSNumber numberWithUnsignedLong:*(void *)((char *)a6->var0 + v17)];
      [v13 addObject:v22];

      v17 += 16;
      --v18;
    }
    while (v18);
  }
  id v29 = v28;
  *uint64_t v25 = v29;
  id v23 = v12;
  *uint64_t v26 = v23;
  id v24 = v13;
  *long long v27 = v24;
}

- (id)packageOutputWithPredictedLabel:(id)a3 classProbabilities:(id)a4 nearestLabels:(id)a5 nearestDistances:(id)a6 nearestFeatureIndices:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v42 = a5;
  id v41 = a6;
  id v40 = a7;
  id v38 = v13;
  v39 = v12;
  id v14 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  if ([(MLKNearestNeighborsClassifier *)self labelType]) {
    +[MLSequence sequenceWithInt64Array:v42];
  }
  else {
  uint64_t v15 = +[MLSequence sequenceWithStringArray:v42];
  }
  char v16 = +[MLFeatureValue featureValueWithSequence:v15];
  [v14 setObject:v16 forKeyedSubscript:@"_debugNearestLabels"];

  uint64_t v17 = +[MLSequence sequenceFromArray:v41 error:0];
  if (v17)
  {
    uint64_t v18 = +[MLFeatureValue featureValueWithSequence:v17];
    [v14 setObject:v18 forKeyedSubscript:@"_debugNearestDistances"];
  }
  id v19 = +[MLSequence sequenceFromArray:v40 error:0];

  if (v19)
  {
    double v20 = +[MLFeatureValue featureValueWithSequence:v19];
    [v14 setObject:v20 forKeyedSubscript:@"_debugNearestFeatureIndices"];
  }
  id v21 = [[MLDictionaryFeatureProvider alloc] initWithFeatureValueDictionary:v14];
  char v22 = +[MLClassifierResult resultWithClassProbability:v13 additionalFeatures:v21 classLabelOfMaxProbability:v12];
  id v23 = [(MLModel *)self modelDescription];
  id v24 = [v23 predictedFeatureName];

  if (v24)
  {
    uint64_t v25 = [(MLModel *)self modelDescription];
    uint64_t v26 = [v25 outputDescriptionsByName];
    long long v27 = [(MLModel *)self modelDescription];
    id v28 = [v27 predictedFeatureName];
    id v29 = [v26 objectForKeyedSubscript:v28];
  }
  else
  {
    id v29 = 0;
  }
  v30 = [(MLModel *)self modelDescription];
  v31 = [v30 predictedProbabilitiesName];

  if (v31)
  {
    id v32 = [(MLModel *)self modelDescription];
    BOOL v33 = [v32 outputDescriptionsByName];
    id v34 = [(MLModel *)self modelDescription];
    id v35 = [v34 predictedProbabilitiesName];
    v31 = [v33 objectForKeyedSubscript:v35];
  }
  objc_super v36 = [v22 asFeatureDictionaryWithPredictedClassDescription:v29 classProbabilityDescription:v31];

  return v36;
}

- (id)inputMultiArray:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MLModel *)self modelDescription];
  id v8 = [v7 inputDescriptionsByName];
  id v9 = [v8 allKeys];
  unint64_t v10 = [v9 objectAtIndexedSubscript:0];

  if (v10)
  {
    uint64_t v11 = [v6 featureValueForName:v10];
    if ([v11 type] == 5)
    {
      id v12 = [v11 multiArrayValue];
      id v13 = v12;
      if (v12 && (id v14 = v12, [v14 bytes]))
      {
        id v15 = v14;
      }
      else if (a4)
      {
        +[MLModelErrorUtils featureTypeErrorWithFormat:@"K Nearest Neighbor models only accept multi array input types."];
        id v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = 0;
      }
    }
    else if (a4)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:@"K Nearest Neighbor models only accept multi array input types."];
      id v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
  }
  else if (a4)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:@"Missing input name for K Nearest Neighbor model."];
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)computeClassProbabilities:(id *)a3 from:(void *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = *(void *)a4;
  uint64_t v6 = *((void *)a4 + 1);
  int64_t v8 = [(MLKNearestNeighborsClassifier *)self weightingScheme];
  id v43 = [(MLKNearestNeighborsClassifier *)self labelsForDataPoints];
  if (v6 == v7)
  {
    double v11 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    if ((unint64_t)((v6 - v7) >> 4) <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = (v6 - v7) >> 4;
    }
    double v11 = 0.0;
    do
    {
      uint64_t v12 = *(void *)a4;
      float v13 = 1.0;
      if (v8 == 1) {
        float v13 = 1.0 / (float)(*(float *)(v12 + v9 + 8) + 0.000001);
      }
      id v14 = [v43 objectAtIndexedSubscript:*(void *)(v12 + v9)];
      id v15 = NSNumber;
      char v16 = [v5 objectForKeyedSubscript:v14];
      [v16 doubleValue];
      double v17 = v13;
      id v19 = [v15 numberWithDouble:v18 + v17];
      [v5 setObject:v19 forKeyedSubscript:v14];

      double v11 = v11 + v17;
      v9 += 16;
      --v10;
    }
    while (v10);
  }
  [(MLKNearestNeighborsClassifier *)self labelsSet];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = 0;
  uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v22)
  {
    id v23 = 0;
    unint64_t v24 = 0;
    uint64_t v25 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(v20);
        }
        long long v27 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * i)];
        [v27 doubleValue];
        double v29 = v28;

        double v30 = v29 / v11;
        if ((unint64_t)v23 >= v24)
        {
          uint64_t v31 = v23 - v21;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 61) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v24 - (void)v21) >> 2 > v32) {
            unint64_t v32 = (uint64_t)(v24 - (void)v21) >> 2;
          }
          if (v24 - (unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v33 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v33 = v32;
          }
          if (v33) {
            unint64_t v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v33);
          }
          else {
            uint64_t v34 = 0;
          }
          id v35 = (double *)(v33 + 8 * v31);
          *id v35 = v30;
          objc_super v36 = v35 + 1;
          while (v23 != v21)
          {
            uint64_t v37 = *((void *)v23-- - 1);
            *((void *)v35-- - 1) = v37;
          }
          unint64_t v24 = v33 + 8 * v34;
          if (v21) {
            operator delete(v21);
          }
          id v21 = v35;
          id v23 = v36;
        }
        else
        {
          *v23++ = v30;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v22);
  }

  id v38 = [MLProbabilityDictionary alloc];
  v39 = [(MLKNearestNeighborsClassifier *)self labelsSet];
  id v40 = [v39 array];
  *a3 = [(MLProbabilityDictionary *)v38 initWithLabels:v40 probabilities:v21];

  if (v21) {
    operator delete(v21);
  }
}

- (vector<std::pair<unsigned)computeKClosestLabels:(std:(float>>> *__return_ptr)retstr :(MLKNearestNeighborsClassifier *)self allocator<std:(SEL)a3 :(id)a4 pair<unsigned)long
{
  id v4 = a4;
  __p = 0;
  uint64_t v31 = 0;
  unint64_t v32 = 0;
  uint64_t v5 = [v4 count];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    int64_t v8 = 0;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v10 = [v4 objectAtIndexedSubscript:i];
      [v10 floatValue];
      int v12 = v11;
      if ((unint64_t)v8 >= v7)
      {
        uint64_t v14 = (v8 - v6) >> 2;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 62) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v7 - (void)v6) >> 1 > v15) {
          unint64_t v15 = (uint64_t)(v7 - (void)v6) >> 1;
        }
        if (v7 - (unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v15;
        }
        if (v16) {
          unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v16);
        }
        else {
          uint64_t v17 = 0;
        }
        double v18 = (_DWORD *)(v16 + 4 * v14);
        *double v18 = v12;
        float v13 = v18 + 1;
        while (v8 != v6)
        {
          int v19 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *--double v18 = v19;
        }
        unint64_t v7 = v16 + 4 * v17;
        __p = v18;
        unint64_t v32 = v7;
        if (v6) {
          operator delete(v6);
        }
        uint64_t v6 = (char *)v18;
      }
      else
      {
        *(_DWORD *)int64_t v8 = v11;
        float v13 = v8 + 4;
      }
      uint64_t v31 = v13;

      int64_t v8 = (char *)v13;
    }
  }
  id v20 = [(MLKNearestNeighborsClassifier *)self parameterContainer];
  id v21 = [v20 currentParameterValues];
  uint64_t v22 = +[MLParameterKey numberOfNeighbors];
  id v23 = [v21 objectForKeyedSubscript:v22];
  uint64_t v24 = [v23 unsignedIntegerValue];

  uint64_t v25 = [(MLKNearestNeighborsClassifier *)self index];
  uint64_t v26 = v25;
  if (v25)
  {
    [v25 findNearestNeighbors:v24 toQueryPoint:&__p];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }

  if (__p)
  {
    uint64_t v31 = __p;
    operator delete(__p);
  }

  return result;
}

- (MLKNearestNeighborsClassifier)initWithDescription:(id)a3 configuration:(id)a4 parameters:(id)a5 dataPoints:(void *)a6 labels:(id)a7 error:(id *)a8
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v46 = a4;
  id v14 = a5;
  id v15 = a7;
  v50.receiver = self;
  v50.super_class = (Class)MLKNearestNeighborsClassifier;
  unint64_t v16 = [(MLModel *)&v50 initWithDescription:v13];
  if (!v16) {
    goto LABEL_15;
  }
  v16->_numberOfDimensions = [v14 numberOfDimensions];
  if (v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)&v16->_labelsForDataPoints, v17);
  uint64_t v18 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v16->_labelsForDataPoints];
  labelsSet = v16->_labelsSet;
  v16->_labelsSet = (NSOrderedSet *)v18;

  uint64_t v20 = [v14 defaultLabel];
  defaultLabel = v16->_defaultLabel;
  v16->_defaultLabel = v20;

  if ([v15 count]) {
    [v15 firstObject];
  }
  else {
  uint64_t v22 = [v14 defaultLabel];
  }
  objc_opt_class();
  v16->_labelType = (objc_opt_isKindOfClass() & 1) == 0;
  v16->_weightingScheme = [v14 weightingScheme];
  uint64_t v23 = [v14 nearestLabelsFeatureName];
  nearestLabelsFeatureName = v16->_nearestLabelsFeatureName;
  v16->_nearestLabelsFeatureName = (NSString *)v23;

  uint64_t v25 = [v14 nearestDistancesFeatureName];
  nearestDistancesFeatureName = v16->_nearestDistancesFeatureName;
  v16->_nearestDistancesFeatureName = (NSString *)v25;

  v16->_indexType = [v14 indexType];
  if ([v14 indexType])
  {
    if ([v14 indexType] != 1)
    {
      if (a8)
      {
        *a8 = +[MLModelErrorUtils genericErrorWithFormat:@"Index type is invalid for this model."];
      }
      goto LABEL_18;
    }
    long long v27 = -[MLNearestNeighborsSingleKdTreeIndex initWithDataset:numberOfDimensions:leafSize:error:]([MLNearestNeighborsSingleKdTreeIndex alloc], "initWithDataset:numberOfDimensions:leafSize:error:", a6, [v14 numberOfDimensions], objc_msgSend(v14, "leafSize"), a8);
    index = v16->_index;
    v16->_index = (MLNearestNeighborsIndex *)v27;
  }
  else
  {
    double v29 = [MLNearestNeighborsLinearIndex alloc];
    __p = 0;
    v48 = 0;
    uint64_t v49 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)a6, *((void *)a6 + 1), (uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 2);
    uint64_t v30 = -[MLNearestNeighborsLinearIndex initWithDataset:numberOfDimensions:](v29, "initWithDataset:numberOfDimensions:", &__p, [v14 numberOfDimensions]);
    uint64_t v31 = v16->_index;
    v16->_index = (MLNearestNeighborsIndex *)v30;

    if (__p)
    {
      v48 = __p;
      operator delete(__p);
    }
  }
  unint64_t v32 = +[MLParameterKey numberOfNeighbors];
  v51[0] = v32;
  unint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  uint64_t v34 = [v13 parameterDescriptionsByKey];
  uint64_t v35 = +[MLParameterContainer parameterContainerFor:v33 descriptions:v34];
  parameterContainer = v16->_parameterContainer;
  v16->_parameterContainer = (MLParameterContainer *)v35;

  uint64_t v37 = v16->_parameterContainer;
  id v38 = [v46 parameters];
  v39 = +[MLParameterKey numberOfNeighbors];
  id v40 = [v38 objectForKeyedSubscript:v39];
  id v41 = +[MLParameterKey numberOfNeighbors];
  LOBYTE(v37) = [(MLParameterContainer *)v37 setCurrentValue:v40 forKey:v41 error:a8];

  if ((v37 & 1) == 0)
  {
LABEL_18:

    id v43 = 0;
    goto LABEL_19;
  }
  id v42 = [(MLModel *)v16 modelDescription];
  [v42 setClassLabels:v15];

LABEL_15:
  id v43 = v16;
LABEL_19:

  return v43;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v5 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"notreesyet"];

  return v5;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a5;
  uint64_t v10 = (CoreML::Specification::protobuf_NearestNeighbors_2eproto *)+[MLModelIOUtils serializeMetadataAndInterfaceFromSpecification:a3 archive:a4 error:a6];
  if ((v10 & 1) == 0)
  {
    int v12 = 0;
    goto LABEL_142;
  }
  id v75 = v9;
  v72 = a3;
  if (*(_DWORD *)(*(void *)a3 + 44) == 404)
  {
    int v11 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_NearestNeighbors_2eproto::InitDefaults(v10);
    int v11 = &CoreML::Specification::_KNearestNeighborsClassifier_default_instance_;
  }
  v91 = &unk_1EF0D7778;
  unint64_t v92 = 0;
  int v97 = 0;
  uint64_t v13 = v11[1];
  if (v13) {
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v92, v13 & 0xFFFFFFFFFFFFFFFELL);
  }
  if (v11 == &CoreML::Specification::_KNearestNeighborsClassifier_default_instance_)
  {
    v93 = 0;
  }
  else
  {
    if (v11[2]) {
      operator new();
    }
    v93 = 0;
    if (v11[3]) {
      operator new();
    }
  }
  v94 = 0;
  int v98 = 0;
  int v14 = *((_DWORD *)v11 + 15);
  if (v14 == 101)
  {
    int v98 = 101;
    operator new();
  }
  if (v14 == 100)
  {
    int v98 = 100;
    operator new();
  }
  unsigned int v99 = 0;
  int v15 = *((_DWORD *)v11 + 16);
  if (v15 == 111)
  {
    unint64_t v16 = (uint64_t *)v11[5];
    CoreML::Specification::KNearestNeighborsClassifier::clear_DefaultClassLabel((uint64_t)&v91);
    unsigned int v99 = 111;
    v96 = v16;
  }
  else if (v15 == 110)
  {
    CoreML::Specification::KNearestNeighborsClassifier::clear_DefaultClassLabel((uint64_t)&v91);
    unsigned int v99 = 110;
    v96 = (uint64_t *)&google::protobuf::internal::fixed_address_empty_string;
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
  }
  int v100 = 0;
  int v17 = *((_DWORD *)v11 + 17);
  if (v17 == 210)
  {
    int v100 = 210;
    operator new();
  }
  if (v17 == 200)
  {
    int v100 = 200;
    operator new();
  }
  if (v93) {
    uint64_t v18 = v93;
  }
  else {
    uint64_t v18 = (const CoreML::Specification::NearestNeighborsIndex *)&CoreML::Specification::_NearestNeighborsIndex_default_instance_;
  }
  CoreML::Specification::NearestNeighborsIndex::NearestNeighborsIndex((CoreML::Specification::NearestNeighborsIndex *)v85, v18);
  operator<<((uint64_t)a4, v88);
  v73 = (char *)a4;
  v74 = a6;
  if (v86 >= 1)
  {
    int v19 = 0;
    uint64_t v20 = 0;
    id v21 = 0;
    uint64_t v22 = 0;
    while (1)
    {
      uint64_t v23 = *(void *)(v87 + 8 * v22 + 8);
      uint64_t v24 = *(void *)(v23 + 24);
      if (v24) {
        uint64_t v25 = (const void *)(v24 + 8);
      }
      else {
        uint64_t v25 = 0;
      }
      unint64_t v26 = *(int *)(v23 + 16);
      v104 = 0;
      v105 = 0;
      v103 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v103, v25, (uint64_t)v25 + 4 * v26, v26);
      long long v27 = v103;
      if (v104 - v103 >= 1)
      {
        double v28 = v19;
        uint64_t v29 = (v104 - v103) >> 2;
        uint64_t v30 = v20 - v28;
        __p = v28;
        uint64_t v31 = &v28[(v20 - v28) & 0xFFFFFFFFFFFFFFFCLL];
        if (v29 <= (v21 - v20) >> 2)
        {
          uint64_t v38 = (v20 - v31) >> 2;
          if (v38 >= v29)
          {
            v39 = &v103[4 * v29];
            id v41 = v20;
LABEL_50:
            id v42 = &v41[-4 * v29];
            id v43 = v41;
            while (v42 < v20)
            {
              int v44 = *(_DWORD *)v42;
              v42 += 4;
              *(_DWORD *)id v43 = v44;
              v43 += 4;
            }
            long long v45 = &v31[4 * v29];
            if (v41 != v45) {
              memmove(&v41[-4 * ((v41 - v45) >> 2)], v31, v41 - v45);
            }
            int v19 = __p;
            if (v39 != v27) {
              memmove(v31, v27, v39 - v27);
            }
            uint64_t v20 = v43;
            goto LABEL_70;
          }
          v39 = &v103[4 * v38];
          uint64_t v40 = v104 - v39;
          if (v104 != v39) {
            memmove(v20, &v103[4 * v38], v104 - v39);
          }
          id v41 = &v20[v40];
          if (v20 - v31 >= 1) {
            goto LABEL_50;
          }
          v20 += v40;
          int v19 = __p;
        }
        else
        {
          uint64_t v32 = v30 >> 2;
          unint64_t v33 = (v30 >> 2) + v29;
          if (v33 >> 62) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          if ((v21 - v28) >> 1 > v33) {
            unint64_t v33 = (v21 - v28) >> 1;
          }
          if ((unint64_t)(v21 - v28) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v33;
          }
          if (v34)
          {
            uint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v34);
            uint64_t v37 = v36;
          }
          else
          {
            uint64_t v35 = 0;
            uint64_t v37 = 0;
          }
          id v46 = &v35[4 * v32];
          long long v47 = &v46[4 * v29];
          uint64_t v48 = 4 * v29;
          uint64_t v49 = v46;
          do
          {
            int v50 = *(_DWORD *)v27;
            v27 += 4;
            *(_DWORD *)uint64_t v49 = v50;
            v49 += 4;
            v48 -= 4;
          }
          while (v48);
          if (v20 != __p)
          {
            uint64_t v51 = 4 * v32;
            do
            {
              *(_DWORD *)&v35[v51 - 4] = *(_DWORD *)&__p[v51 - 4];
              v51 -= 4;
            }
            while (v51);
            id v46 = v35;
          }
          size_t v52 = v20 - v31;
          if (v52) {
            memmove(v47, v31, v52);
          }
          id v21 = &v35[4 * v37];
          uint64_t v20 = &v47[v52];
          if (__p) {
            operator delete(__p);
          }
          int v19 = v46;
        }
      }
LABEL_70:
      if (v103) {
        operator delete(v103);
      }
      if (++v22 >= v86) {
        goto LABEL_75;
      }
    }
  }
  int v19 = 0;
  uint64_t v20 = 0;
LABEL_75:
  unint64_t v53 = (v20 - v19) >> 2;
  id v9 = v75;
  __pa = v19;
  operator<<((uint64_t)v73, v53);
  if (v20 != v19)
  {
    uint64_t v54 = 0;
    if (v53 <= 1) {
      unint64_t v53 = 1;
    }
    do
      operator<<((uint64_t)v73, *(float *)&v19[4 * v54++]);
    while (v53 != v54);
  }
  if (v98)
  {
    if (v98 == 100)
    {
      uint64_t v57 = v95;
      operator<<((uint64_t)v73, 100);
      operator<<((uint64_t)v73, *(int *)(v57 + 24));
      if (*(int *)(v57 + 24) >= 1)
      {
        uint64_t v58 = 0;
        do
          operator<<((uint64_t)v73, *(uint64_t **)(*(void *)(v57 + 32) + 8 * v58++ + 8));
        while (v58 < *(int *)(v57 + 24));
      }
    }
    else if (v98 == 101)
    {
      uint64_t v55 = v95;
      operator<<((uint64_t)v73, 101);
      operator<<((uint64_t)v73, *(int *)(v55 + 16));
      if (*(int *)(v55 + 16) >= 1)
      {
        uint64_t v56 = 0;
        do
          operator<<((uint64_t)v73, *(void *)(*(void *)(v55 + 24) + 8 * v56++ + 8));
        while (v56 < *(int *)(v55 + 16));
      }
    }
  }
  else
  {
    operator<<((uint64_t)v73, 0);
  }
  operator<<((uint64_t)v73, v99);
  if (v99 == 110)
  {
    operator<<((uint64_t)v73, v96);
  }
  else if (v99 == 111)
  {
    operator<<((uint64_t)v73, (uint64_t)v96);
  }
  if (v100 == 200)
  {
    int v59 = 0;
  }
  else
  {
    if (v100 != 210) {
      goto LABEL_100;
    }
    int v59 = 1;
  }
  operator<<((uint64_t)v73, v59);
LABEL_100:
  if (v90 == 100)
  {
    int v62 = 0;
LABEL_107:
    operator<<((uint64_t)v73, v62);
    goto LABEL_108;
  }
  if (v90 == 110)
  {
    v60 = (CoreML::Specification::protobuf_NearestNeighbors_2eproto *)operator<<((uint64_t)v73, 1);
    if (v90 == 110)
    {
      v61 = v89;
    }
    else
    {
      CoreML::Specification::protobuf_NearestNeighbors_2eproto::InitDefaults(v60);
      v61 = &CoreML::Specification::_SingleKdTreeIndex_default_instance_;
    }
    int v62 = *((_DWORD *)v61 + 4);
    goto LABEL_107;
  }
LABEL_108:
  if (*(unsigned char *)(*(void *)v72 + 28))
  {
    std::string::basic_string[abi:ne180100]<0>(v82, "updateParameters");
    v63 = OArchive::nestedArchive(v73, (uint64_t)v82);
    if (SHIBYTE(v83) < 0) {
      operator delete(v82[0]);
    }
    (*(void (**)(void))(**((void **)v63 + 1) + 56))(*((void *)v63 + 1));
    LOBYTE(v103) = *v63;
    v64 = (std::__shared_weak_count *)*((void *)v63 + 2);
    v104 = (unsigned char *)*((void *)v63 + 1);
    v105 = v64;
    if (v64) {
      atomic_fetch_add_explicit(&v64->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)&v106, (void *)v63 + 3);
    operator<<((uint64_t)&v103, 0);
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v107);
    if (v105) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v105);
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&v103, "modelParameters");
  v65 = OArchive::nestedArchive(v73, (uint64_t)&v103);
  if (SHIBYTE(v105) < 0) {
    operator delete(v103);
  }
  (*(void (**)(void))(**((void **)v65 + 1) + 56))(*((void *)v65 + 1));
  LOBYTE(v82[0]) = *v65;
  v66 = (std::__shared_weak_count *)*((void *)v65 + 2);
  v82[1] = *((void **)v65 + 1);
  v83 = v66;
  if (v66) {
    atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v84, (void *)v65 + 3);
  operator<<((uint64_t)v82, 0);
  if (v94) {
    v67 = v94;
  }
  else {
    v67 = (google::protobuf::MessageLite *)&CoreML::Specification::_Int64Parameter_default_instance_;
  }
  std::string::basic_string[abi:ne180100]<0>(v78, "numberOfNeighbors");
  std::string::basic_string[abi:ne180100]<0>(&v103, "modelParameters");
  v68 = OArchive::nestedArchive(v73, (uint64_t)&v103);
  if (SHIBYTE(v105) < 0) {
    operator delete(v103);
  }
  (*(void (**)(void))(**((void **)v68 + 1) + 56))(*((void *)v68 + 1));
  v69 = OArchive::nestedArchive(v68, (uint64_t)v78);
  (*(void (**)(void))(**((void **)v69 + 1) + 56))(*((void *)v69 + 1));
  v70 = (std::__shared_weak_count *)(*(uint64_t (**)(void))(**((void **)v69 + 1) + 56))(*((void *)v69 + 1));
  v103 = (char *)&unk_1EF0DB360;
  v104 = &unk_1EF0DB338;
  v105 = v70;
  v106 = &unk_1EF0DB3E8;
  v107 = (char *)&v104;
  __int16 v108 = 0;
  uint64_t v109 = 0;
  uint64_t v110 = 0;
  uint64_t v111 = 0x2000;
  if (google::protobuf::MessageLite::SerializeToZeroCopyStream(v67, (google::protobuf::io::ZeroCopyOutputStream *)&v103))
  {
    CoreML::Result::Result((CoreML::Result *)v80);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v101, "unable to serialize object");
    v80[0] = 4;
    std::operator+<char>();
    if (v102 < 0) {
      operator delete(v101);
    }
  }
  google::protobuf::io::OstreamOutputStream::~OstreamOutputStream((google::protobuf::io::OstreamOutputStream *)&v103);
  if (v79 < 0) {
    operator delete(v78[0]);
  }
  if ((v80[0] & 0xFFFFFFEF) != 0)
  {
    if (v74)
    {
      +[MLModelErrorUtils IOErrorWithFormat:@"Failed to archive model parameters."];
      int v12 = 0;
      id *v74 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = +[MLCompilerResult resultWithArchive:v73];
  }
  if (v81 < 0) {
    operator delete((void *)v80[1]);
  }
  std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v84[1]);
  if (v83) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v83);
  }
  if (__pa) {
    operator delete(__pa);
  }
  CoreML::Specification::NearestNeighborsIndex::~NearestNeighborsIndex((CoreML::Specification::NearestNeighborsIndex *)v85);
  CoreML::Specification::KNearestNeighborsClassifier::~KNearestNeighborsClassifier((CoreML::Specification::KNearestNeighborsClassifier *)&v91);
LABEL_142:

  return v12;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  id v38 = a5;
  id v11 = a6;
  id v12 = [[MLModelDescription alloc] initFromSingleFunctionCompiledModelArchive:a3 error:a7];
  uint64_t v13 = objc_alloc_init(MLKNearestNeighborsClassifierParameters);
  int v50 = 0;
  operator>>((uint64_t)a3);
  [(MLKNearestNeighborsClassifierParameters *)v13 setNumberOfDimensions:0];
  long long v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  v63.__r_.__value_.__r.__words[0] = 0;
  operator>>((uint64_t)a3);
  std::vector<float>::resize((char **)&v47, 0);
  if (v63.__r_.__value_.__r.__words[0])
  {
    std::string::size_type v14 = 0;
    int v15 = (char *)v47;
    do
    {
      operator>>((uint64_t)a3);
      ++v14;
      v15 += 4;
    }
    while (v14 < v63.__r_.__value_.__r.__words[0]);
  }
  uint64_t v53 = 0;
  operator>>((uint64_t)a3);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v53 == 100)
  {
    v43[0] = 0;
    operator>>((uint64_t)a3);
LABEL_11:
    unint64_t v19 = (unint64_t)v16;
    goto LABEL_13;
  }
  if (v53 == 101)
  {
    v63.__r_.__value_.__r.__words[0] = 0;
    operator>>((uint64_t)a3);
    if (v63.__r_.__value_.__r.__words[0])
    {
      std::string::size_type v17 = 0;
      do
      {
        v43[0] = 0;
        operator>>((uint64_t)a3);
        uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", 0, v36, v38);
        [v16 addObject:v18];

        ++v17;
      }
      while (v17 < v63.__r_.__value_.__r.__words[0]);
    }
    goto LABEL_11;
  }
  unint64_t v19 = 0;
LABEL_13:

  uint64_t v53 = 0;
  operator>>((uint64_t)a3);
  if (v53 == 110)
  {
    memset(&v63, 0, sizeof(v63));
    operator>>((uint64_t)a3, &v63);
    if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      id v21 = &v63;
    }
    else {
      id v21 = (std::string *)v63.__r_.__value_.__r.__words[0];
    }
    uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", v21, v36);
    if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v63.__r_.__value_.__l.__data_);
    }
  }
  else if (v53 == 111)
  {
    v63.__r_.__value_.__r.__words[0] = 0;
    operator>>((uint64_t)a3);
    uint64_t v20 = [NSNumber numberWithLongLong:v63.__r_.__value_.__r.__words[0]];
  }
  else
  {
    uint64_t v20 = 0;
  }
  -[MLKNearestNeighborsClassifierParameters setDefaultLabel:](v13, "setDefaultLabel:", v20, v36);
  [(MLKNearestNeighborsClassifierParameters *)v13 setNearestLabelsFeatureName:0];
  [(MLKNearestNeighborsClassifierParameters *)v13 setNearestDistancesFeatureName:0];
  int v46 = 0;
  operator>>((uint64_t)a3);
  [(MLKNearestNeighborsClassifierParameters *)v13 setWeightingScheme:0];
  int v44 = 0;
  int v45 = 0;
  operator>>((uint64_t)a3);
  [(MLKNearestNeighborsClassifierParameters *)v13 setIndexType:0];
  if (!(v19 | v20))
  {
    if (a7)
    {
      uint64_t v22 = @"Unable to load class labels for k-Nearest-Neighbor model.";
LABEL_28:
      +[MLModelErrorUtils genericErrorWithFormat:v22];
      uint64_t v23 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  if (((v48 - (unsigned char *)v47) >> 2) % (unint64_t)v50)
  {
    if (a7)
    {
      uint64_t v22 = @"Invalid k-nearest neighbor model -- the length of the data vector is not a multiple of the given dimensionality.";
      goto LABEL_28;
    }
    goto LABEL_51;
  }
  std::string::basic_string[abi:ne180100]<0>(&v63, "modelParameters");
  int hasNestedArchive = IArchive::hasNestedArchive(a3, &v63);
  int v25 = hasNestedArchive;
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if (!v25) {
      goto LABEL_52;
    }
  }
  else if (!hasNestedArchive)
  {
    goto LABEL_52;
  }
  CoreML::Specification::Int64Parameter::Int64Parameter((CoreML::Specification::Int64Parameter *)v43);
  std::string::basic_string[abi:ne180100]<0>(v39, "numberOfNeighbors");
  std::string::basic_string[abi:ne180100]<0>(&v63, "modelParameters");
  unint64_t v26 = IArchive::nestedArchive(a3, (uint64_t)&v63);
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v63.__r_.__value_.__l.__data_);
  }
  long long v27 = IArchive::nestedArchive(v26, (uint64_t)v39);
  uint64_t v28 = (*(uint64_t (**)(void))(**(void **)(*(void *)v27 + 32) + 16))(*(void *)(*(void *)v27 + 32));
  v63.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1EF0DB2F8;
  v63.__r_.__value_.__l.__size_ = (std::string::size_type)&unk_1EF0DB2C8;
  v63.__r_.__value_.__r.__words[2] = v28;
  v64[0] = &unk_1EF0DB3A8;
  v64[1] = &v63.__r_.__value_.__l.__size_;
  __int16 v65 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v69 = 0;
  int v68 = 0x2000;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = &v63;
  *(void *)uint64_t v56 = 0;
  *(void *)((char *)&v56[1] + 2) = 0;
  uint64_t v57 = 0x7FFFFFFFLL;
  uint64_t v58 = 0x647FFFFFFFLL;
  int v59 = 100;
  char v60 = 1;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v53);
  LODWORD(v58) = 0x7FFFFFFF;
  uint64_t v29 = v54 + SHIDWORD(v57);
  uint64_t v54 = v29;
  int v30 = v56[0] - v57;
  if (v56[0] <= (int)v57) {
    int v30 = 0;
  }
  else {
    uint64_t v54 = v29 - v30;
  }
  HIDWORD(v57) = v30;
  if (google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)v43, (google::protobuf::io::CodedInputStream *)&v53))
  {
    CoreML::Result::Result((CoreML::Result *)v41);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v41[0] = 5;
    std::operator+<char>();
    if (v52 < 0) {
      operator delete(__p);
    }
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v53);
  v63.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1EF0DB2F8;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v64);
  if (v40 < 0) {
    operator delete(v39[0]);
  }
  unsigned int v31 = v41[0] & 0xFFFFFFEF;
  if ((v41[0] & 0xFFFFFFEF) != 0)
  {
    if (a7)
    {
      *a7 = +[MLModelErrorUtils IOErrorWithFormat:@"Failed to unarchive model parameters."];
    }
  }
  else
  {
    uint64_t v32 = +[MLParameterKey numberOfNeighbors];
    unint64_t v33 = +[MLParameterDescription parameterDescriptionForKey:v32 int64ParameterSpec:v43];

    v70[0] = v33;
    unint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
    +[MLParameterUtils appendParameterDescriptions:v34 toModelDescription:v12];
  }
  if (v42 < 0) {
    operator delete((void *)v41[1]);
  }
  CoreML::Specification::Int64Parameter::~Int64Parameter((CoreML::Specification::Int64Parameter *)v43);
  if (v31)
  {
LABEL_51:
    uint64_t v23 = 0;
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v23 = [[MLKNearestNeighborsClassifier alloc] initWithDescription:v12 configuration:v11 parameters:v13 dataPoints:&v47 labels:v19 error:a7];
LABEL_53:

  if (v47)
  {
    uint64_t v48 = v47;
    operator delete(v47);
  }

  return v23;
}

@end