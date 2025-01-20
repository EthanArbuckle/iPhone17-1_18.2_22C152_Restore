@interface PKLiveMathVariable
@end

@implementation PKLiveMathVariable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenStrokeIndexes, 0);
  objc_storeStrong((id *)&self->_tokenSymbols, 0);
  objc_storeStrong((id *)&self->_scrubbedVariableImageView, 0);
  objc_storeStrong((id *)&self->_scrubbedVariableDrawing, 0);
  objc_storeStrong((id *)&self->_originalStrokesDrawing, 0);
  objc_storeStrong((id *)&self->_originalStrokes, 0);
  objc_storeStrong((id *)&self->_mathItem, 0);
  objc_storeStrong((id *)&self->_variable, 0);

  objc_storeStrong((id *)&self->_drawing, 0);
}

@end