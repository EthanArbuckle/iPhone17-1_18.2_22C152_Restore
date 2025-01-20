@interface PKTranscriptionQuery
- (CHTranscriptionQuery)transcriptionQuery;
- (NSString)transcription;
- (PKTranscriptionQuery)initWithRecognitionSessionManager:(id)a3;
- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (void)dealloc;
- (void)pause;
- (void)setTranscriptionQuery:(id)a3;
- (void)start;
- (void)teardown;
@end

@implementation PKTranscriptionQuery

- (PKTranscriptionQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTranscriptionQuery;
  v5 = [(PKQuery *)&v11 initWithRecognitionSessionManager:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F5C0D8]);
    v7 = -[PKRecognitionSessionManager session](v4);
    uint64_t v8 = [v6 initWithRecognitionSession:v7];
    transcriptionQuery = v5->_transcriptionQuery;
    v5->_transcriptionQuery = (CHTranscriptionQuery *)v8;
  }
  return v5;
}

- (void)start
{
  id v2 = [(PKTranscriptionQuery *)self transcriptionQuery];
  [v2 start];
}

- (void)pause
{
  id v2 = [(PKTranscriptionQuery *)self transcriptionQuery];
  [v2 pause];
}

- (void)teardown
{
  [(PKTranscriptionQuery *)self pause];

  [(PKTranscriptionQuery *)self setTranscriptionQuery:0];
}

- (void)dealloc
{
  [(PKTranscriptionQuery *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)PKTranscriptionQuery;
  [(PKTranscriptionQuery *)&v3 dealloc];
}

- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [(PKTranscriptionQuery *)self transcriptionQuery];
  v12 = [v11 contextualTextResultsForContextStrokes:v10 completion:v9 shouldCancel:v8];

  return v12;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (CHTranscriptionQuery)transcriptionQuery
{
  return self->_transcriptionQuery;
}

- (void)setTranscriptionQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptionQuery, 0);

  objc_storeStrong((id *)&self->_transcription, 0);
}

@end