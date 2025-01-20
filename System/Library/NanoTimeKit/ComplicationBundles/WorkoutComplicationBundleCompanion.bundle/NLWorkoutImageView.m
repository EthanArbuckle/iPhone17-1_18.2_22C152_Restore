@interface NLWorkoutImageView
- (NLWorkoutImageView)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startAnimating;
@end

@implementation NLWorkoutImageView

- (NLWorkoutImageView)init
{
  v5.receiver = self;
  v5.super_class = (Class)NLWorkoutImageView;
  v2 = [(NLWorkoutImageView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NLWorkoutImageView *)v2 addObserver:v2 forKeyPath:@"layer.contentsMultiplyColor" options:0 context:&off_C460];
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_C460)
  {
    id v9 = [(NLWorkoutImageView *)self tintColor];
    id v7 = [v9 CGColor];
    v8 = [(NLWorkoutImageView *)self layer];
    [v8 setContentsMultiplyColor:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NLWorkoutImageView;
    -[NLWorkoutImageView observeValueForKeyPath:ofObject:change:context:](&v10, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)dealloc
{
  [(NLWorkoutImageView *)self removeObserver:self forKeyPath:@"layer.contentsMultiplyColor"];
  v3.receiver = self;
  v3.super_class = (Class)NLWorkoutImageView;
  [(NLWorkoutImageView *)&v3 dealloc];
}

- (void)startAnimating
{
  v4.receiver = self;
  v4.super_class = (Class)NLWorkoutImageView;
  [(NLWorkoutImageView *)&v4 startAnimating];
  objc_super v3 = [(NLWorkoutImageView *)self layer];
  [v3 removeAnimationForKey:@"contentsMultiplyColor"];
}

@end