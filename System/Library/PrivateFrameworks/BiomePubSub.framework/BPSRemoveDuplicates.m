@interface BPSRemoveDuplicates
- (BPSPublisher)upstream;
- (BPSRemoveDuplicates)initWithUpstream:(id)a3 isDuplicate:(id)a4;
- (id)isDuplicate;
- (id)last;
- (id)nextEvent;
- (id)upstreamPublishers;
- (void)reset;
- (void)setLast:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSRemoveDuplicates

- (BPSRemoveDuplicates)initWithUpstream:(id)a3 isDuplicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSRemoveDuplicates;
  v9 = [(BPSRemoveDuplicates *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    uint64_t v11 = [v8 copy];
    id isDuplicate = v10->_isDuplicate;
    v10->_id isDuplicate = (id)v11;
  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BPSRemoveDuplicates subscribe:]((uint64_t)self, v5);
  }

  v6 = [[_BPSRemoveDuplicatesInner alloc] initWithDownstream:v4 isDuplicate:self->_isDuplicate];
  id v7 = [(BPSRemoveDuplicates *)self upstream];
  [v7 subscribe:v6];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSRemoveDuplicates *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  v3 = [(BPSRemoveDuplicates *)self upstream];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    while (1)
    {
      uint64_t v5 = [(BPSRemoveDuplicates *)self last];
      if (!v5) {
        break;
      }
      v6 = (void *)v5;
      id v7 = [(BPSRemoveDuplicates *)self isDuplicate];
      id v8 = [(BPSRemoveDuplicates *)self last];
      char v9 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v8, v4);

      if ((v9 & 1) == 0) {
        break;
      }
      v10 = [(BPSRemoveDuplicates *)self upstream];
      uint64_t v11 = [v10 nextEvent];

      id v4 = (void *)v11;
      if (!v11) {
        goto LABEL_7;
      }
    }
    [(BPSRemoveDuplicates *)self setLast:v4];
  }
LABEL_7:
  return v4;
}

- (void)reset
{
  [(BPSRemoveDuplicates *)self setLast:0];
  v3.receiver = self;
  v3.super_class = (Class)BPSRemoveDuplicates;
  [(BPSPublisher *)&v3 reset];
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)isDuplicate
{
  return self->_isDuplicate;
}

- (id)last
{
  return self->_last;
}

- (void)setLast:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_last, 0);
  objc_storeStrong(&self->_isDuplicate, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v3, 0xCu);
}

@end