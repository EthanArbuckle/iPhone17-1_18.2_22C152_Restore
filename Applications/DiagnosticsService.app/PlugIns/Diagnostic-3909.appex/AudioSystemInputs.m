@interface AudioSystemInputs
- (BOOL)_applyComponentArrayParameter:(id)a3 requiredFiles:(id)a4;
- (BOOL)sendRawData;
- (BOOL)sequentialAudioInput;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)accessoryModelNumbers;
- (NSArray)audioFilesPerOutputComponent;
- (NSArray)requiredFiles;
- (NSNumber)xComponentAccelThreshold;
- (void)setAccessoryModelNumbers:(id)a3;
- (void)setAudioFilesPerOutputComponent:(id)a3;
- (void)setRequiredFiles:(id)a3;
- (void)setSendRawData:(BOOL)a3;
- (void)setSequentialAudioInput:(BOOL)a3;
- (void)setXComponentAccelThreshold:(id)a3;
@end

@implementation AudioSystemInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  unsigned __int8 v17 = 0;
  v5 = +[NSSet setWithObject:objc_opt_class()];
  v6 = [v4 dk_arrayFromRequiredKey:@"requiredFiles" types:v5 maxLength:80 failed:&v17 validator:&stru_100010490];
  [(AudioSystemInputs *)self setRequiredFiles:v6];

  v7 = [(AudioSystemInputs *)self requiredFiles];
  id v8 = [v7 count];

  if (!v8) {
    unsigned __int8 v17 = 1;
  }
  v9 = +[NSSet setWithObject:objc_opt_class()];
  v10 = [v4 dk_arrayFromRequiredKey:@"audioFilesPerOutputComponent" types:v9 maxLength:2 failed:&v17];

  if ((unint64_t)[v10 count] < 2 || v17)
  {
    unsigned __int8 v17 = 1;
  }
  else
  {
    v11 = [(AudioSystemInputs *)self requiredFiles];
    unsigned __int8 v17 = [(AudioSystemInputs *)self _applyComponentArrayParameter:v10 requiredFiles:v11];
  }
  v12 = +[NSSet setWithObject:objc_opt_class()];
  v13 = [v4 dk_arrayFromRequiredKey:@"accessoryModelNumbers" types:v12 maxLength:50 failed:&v17 validator:&stru_1000104B0];
  [(AudioSystemInputs *)self setAccessoryModelNumbers:v13];

  [self setSequentialAudioInput:[v4 dk_BOOLFromRequiredKey:@"sequentialAudioInput" failed:&v17]];
  -[AudioSystemInputs setSendRawData:[self dk_BOOLFromKey:@"sendRawData" defaultValue:0 failed:&v17]];
  v14 = [v4 dk_numberFromKey:@"xComponentAccelOrientationThreshold" lowerBound:&off_1000108E0 upperBound:&off_1000108F0 defaultValue:0 failed:&v17];
  [(AudioSystemInputs *)self setXComponentAccelThreshold:v14];

  BOOL v15 = v17 == 0;
  return v15;
}

- (BOOL)_applyComponentArrayParameter:(id)a3 requiredFiles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v8 = +[NSSet setWithArray:v7];
  v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008E64;
  v13[3] = &unk_1000104D8;
  id v10 = v8;
  id v14 = v10;
  v16 = &v17;
  id v11 = v9;
  id v15 = v11;
  [v6 enumerateObjectsUsingBlock:v13];
  [(AudioSystemInputs *)self setAudioFilesPerOutputComponent:v11];
  LOBYTE(self) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

- (NSArray)requiredFiles
{
  return self->_requiredFiles;
}

- (void)setRequiredFiles:(id)a3
{
}

- (NSArray)audioFilesPerOutputComponent
{
  return self->_audioFilesPerOutputComponent;
}

- (void)setAudioFilesPerOutputComponent:(id)a3
{
}

- (NSArray)accessoryModelNumbers
{
  return self->_accessoryModelNumbers;
}

- (void)setAccessoryModelNumbers:(id)a3
{
}

- (BOOL)sequentialAudioInput
{
  return self->_sequentialAudioInput;
}

- (void)setSequentialAudioInput:(BOOL)a3
{
  self->_sequentialAudioInput = a3;
}

- (BOOL)sendRawData
{
  return self->_sendRawData;
}

- (void)setSendRawData:(BOOL)a3
{
  self->_sendRawData = a3;
}

- (NSNumber)xComponentAccelThreshold
{
  return self->_xComponentAccelThreshold;
}

- (void)setXComponentAccelThreshold:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xComponentAccelThreshold, 0);
  objc_storeStrong((id *)&self->_accessoryModelNumbers, 0);
  objc_storeStrong((id *)&self->_audioFilesPerOutputComponent, 0);

  objc_storeStrong((id *)&self->_requiredFiles, 0);
}

@end