@interface _MLNeuralNetworkBasicTensorDataStore
- (BOOL)writeToFile:(id)a3 error:(id *)a4;
- (NSMutableData)data;
- (_MLNeuralNetworkBasicTensorDataStore)initWithContentsOfFile:(id)a3 error:(id *)a4;
- (_MLNeuralNetworkBasicTensorDataStore)initWithData:(id)a3;
- (id)tensorDataForOffset:(unint64_t)a3 expectedLength:(unint64_t)a4;
@end

@implementation _MLNeuralNetworkBasicTensorDataStore

- (void).cxx_destruct
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(_MLNeuralNetworkBasicTensorDataStore *)self data];
  LOBYTE(a4) = [v7 writeToFile:v6 options:1 error:a4];

  return (char)a4;
}

- (id)tensorDataForOffset:(unint64_t)a3 expectedLength:(unint64_t)a4
{
  unint64_t v7 = a4 + a3;
  v8 = [(_MLNeuralNetworkBasicTensorDataStore *)self data];
  unint64_t v9 = [v8 length];

  if (v7 <= v9)
  {
    id v11 = [(_MLNeuralNetworkBasicTensorDataStore *)self data];
    unint64_t v12 = [v11 mutableBytes] + a3;

    v10 = [MEMORY[0x1E4F30C80] dataWithBytesNoCopy:v12 length:a4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_MLNeuralNetworkBasicTensorDataStore)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLNeuralNetworkBasicTensorDataStore;
  id v6 = [(_MLNeuralNetworkBasicTensorDataStore *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (_MLNeuralNetworkBasicTensorDataStore)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MLNeuralNetworkBasicTensorDataStore;
  unint64_t v7 = [(_MLNeuralNetworkBasicTensorDataStore *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithContentsOfFile:v6 options:0 error:a4];
    data = v7->_data;
    v7->_data = (NSMutableData *)v8;
  }
  return v7;
}

@end